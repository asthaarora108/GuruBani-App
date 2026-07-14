import Foundation
import AVFoundation
import Combine
import MediaPlayer
import UIKit
import os

/// Central audio engine for the app.
///
/// Why an `ObservableObject` instead of view-local `@State`:
/// the player needs a repeating timer to publish playback position to the UI
/// (for the scrubber), a delegate callback to reset when a track ends, and a
/// single owner for the `AVAudioSession`. Keeping all of that in one observable
/// type means the SwiftUI view just binds to published values and stays simple.
final class AudioPlayerManager: NSObject, ObservableObject {

    private static let log = Logger(subsystem: "GuruBani", category: "audio")

    // Published state the UI binds to.
    @Published var isPlaying = false
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0

    /// Recitation speed. AVAudioPlayer supports this natively once
    /// `enableRate` is set; slower speeds help learners follow along.
    @Published var playbackRate: Float = 1.0 {
        didSet {
            Self.log.debug("playbackRate -> \(self.playbackRate)")
            if isPlaying { player?.rate = playbackRate }
            updateNowPlaying()
        }
    }

    /// Set by the view while the user is dragging the scrubber so the playback
    /// timer doesn't overwrite the position out from under their finger.
    var isScrubbing = false

    private var player: AVAudioPlayer?
    private var timer: Timer?
    /// The resource name (without extension) currently loaded — lets us resume
    /// instead of restarting when the same bani's play button is tapped again.
    private(set) var currentFile: String?
    /// Human-readable title shown on the lock screen / Control Center.
    private var currentTitle: String = ""

    override init() {
        super.init()
        configureRemoteCommands()
    }

    // MARK: - Session

    /// Configure the shared audio session for `.playback`, which is what lets
    /// audio keep playing when the device is locked or the silent switch is on.
    /// This is REQUIRED for App Store recitation apps — without it, audio stops
    /// the moment the screen turns off.
    private func configureSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .spokenAudio)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            Self.log.error("Session error: \(error.localizedDescription)")
        }
    }

    // MARK: - Loading

    /// Loads a track if it isn't already the current one. Idempotent: tapping
    /// play on the already-loaded track keeps its position.
    func load(fileName: String, title: String) {
        Self.log.debug("load(\(fileName)) current=\(self.currentFile ?? "nil")")
        currentTitle = title
        if currentFile == fileName, player != nil { return }

        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            Self.log.error("Missing resource: \(fileName).mp3")
            return
        }
        do {
            let newPlayer = try AVAudioPlayer(contentsOf: url)
            newPlayer.delegate = self
            newPlayer.enableRate = true
            newPlayer.prepareToPlay()
            player = newPlayer
            duration = newPlayer.duration
            currentTime = 0
            currentFile = fileName
            updateNowPlaying()
        } catch {
            Self.log.error("Load error: \(error.localizedDescription)")
        }
    }

    // MARK: - Transport

    func togglePlayPause(fileName: String, title: String) {
        Self.log.debug("togglePlayPause(\(fileName)) isPlaying=\(self.isPlaying)")
        if currentFile != fileName { load(fileName: fileName, title: title) }
        isPlaying ? pause() : play()
    }

    func play() {
        Self.log.debug("play() file=\(self.currentFile ?? "nil") at=\(self.currentTime)")
        configureSession()
        player?.play()
        player?.rate = playbackRate
        isPlaying = true
        // Keep the screen awake so users can read along during a long recitation.
        UIApplication.shared.isIdleTimerDisabled = true
        startTimer()
        updateNowPlaying()
    }

    func pause() {
        Self.log.debug("pause() at=\(self.currentTime)")
        player?.pause()
        isPlaying = false
        UIApplication.shared.isIdleTimerDisabled = false
        stopTimer()
        updateNowPlaying()
    }

    /// Skip relative to the current position, clamped to the track bounds.
    func seek(by seconds: Double) {
        guard let player = player else { return }
        let newTime = min(max(player.currentTime + seconds, 0), player.duration)
        Self.log.debug("seek(by: \(seconds)) -> \(newTime)")
        player.currentTime = newTime
        currentTime = newTime
        updateNowPlaying()
    }

    /// Jump to an absolute position (used by the scrubber).
    func seek(to time: Double) {
        guard let player = player else { return }
        let clamped = min(max(time, 0), player.duration)
        Self.log.debug("seek(to: \(time)) -> \(clamped)")
        player.currentTime = clamped
        currentTime = clamped
        updateNowPlaying()
    }

    /// Called when leaving the screen — stop audio and release the idle lock so
    /// we never leave the device awake after the view disappears.
    func stop() {
        Self.log.debug("stop()")
        pause()
        player?.stop()
        player?.currentTime = 0
        currentTime = 0
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nil
    }

    // MARK: - Lock screen / Control Center

    /// Wire up the system remote controls (lock screen, Control Center,
    /// headphone buttons). Without this the audio plays in the background
    /// but the user has no way to pause it from the lock screen.
    private func configureRemoteCommands() {
        let center = MPRemoteCommandCenter.shared()

        center.playCommand.addTarget { [weak self] _ in
            guard let self, self.player != nil else { return .commandFailed }
            self.play()
            return .success
        }
        center.pauseCommand.addTarget { [weak self] _ in
            guard let self, self.player != nil else { return .commandFailed }
            self.pause()
            return .success
        }
        center.togglePlayPauseCommand.addTarget { [weak self] _ in
            guard let self, self.player != nil else { return .commandFailed }
            self.isPlaying ? self.pause() : self.play()
            return .success
        }
        center.skipBackwardCommand.preferredIntervals = [5]
        center.skipBackwardCommand.addTarget { [weak self] _ in
            self?.seek(by: -5)
            return .success
        }
        center.skipForwardCommand.preferredIntervals = [5]
        center.skipForwardCommand.addTarget { [weak self] _ in
            self?.seek(by: 5)
            return .success
        }
        center.changePlaybackPositionCommand.addTarget { [weak self] event in
            guard let event = event as? MPChangePlaybackPositionCommandEvent else {
                return .commandFailed
            }
            self?.seek(to: event.positionTime)
            return .success
        }
    }

    /// Publish title/position/rate so the lock screen shows a proper
    /// Now Playing card with a live scrubber.
    private func updateNowPlaying() {
        guard player != nil else { return }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle: currentTitle,
            MPMediaItemPropertyArtist: "GuruBani",
            MPMediaItemPropertyPlaybackDuration: duration,
            MPNowPlayingInfoPropertyElapsedPlaybackTime: currentTime,
            MPNowPlayingInfoPropertyPlaybackRate: isPlaying ? Double(playbackRate) : 0.0
        ]
    }

    // MARK: - Timer

    private func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { [weak self] _ in
            guard let self = self, let player = self.player else { return }
            guard !self.isScrubbing else { return }
            self.currentTime = player.currentTime
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    /// `mm:ss` formatting for the time labels around the scrubber.
    static func formatTime(_ seconds: Double) -> String {
        guard seconds.isFinite, seconds >= 0 else { return "0:00" }
        let total = Int(seconds)
        return String(format: "%d:%02d", total / 60, total % 60)
    }
}

extension AudioPlayerManager: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        Self.log.debug("didFinishPlaying success=\(flag)")
        isPlaying = false
        currentTime = 0
        player.currentTime = 0
        UIApplication.shared.isIdleTimerDisabled = false
        stopTimer()
        updateNowPlaying()
    }
}
