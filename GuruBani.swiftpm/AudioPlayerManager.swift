import Foundation
import AVFoundation
import Combine
import UIKit

/// Central audio engine for the app.
///
/// Why an `ObservableObject` instead of view-local `@State`:
/// the player needs a repeating timer to publish playback position to the UI
/// (for the scrubber), a delegate callback to reset when a track ends, and a
/// single owner for the `AVAudioSession`. Keeping all of that in one observable
/// type means the SwiftUI view just binds to published values and stays simple.
final class AudioPlayerManager: NSObject, ObservableObject {

    // Published state the UI binds to.
    @Published var isPlaying = false
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0

    /// Set by the view while the user is dragging the scrubber so the playback
    /// timer doesn't overwrite the position out from under their finger.
    var isScrubbing = false

    private var player: AVAudioPlayer?
    private var timer: Timer?
    /// The resource name (without extension) currently loaded — lets us resume
    /// instead of restarting when the same bani's play button is tapped again.
    private(set) var currentFile: String?

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
            print("[AudioPlayerManager] Session error: \(error.localizedDescription)")
        }
    }

    // MARK: - Loading

    /// Loads a track if it isn't already the current one. Idempotent: tapping
    /// play on the already-loaded track keeps its position.
    func load(fileName: String) {
        if currentFile == fileName, player != nil { return }

        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("[AudioPlayerManager] Missing resource: \(fileName).mp3")
            return
        }
        do {
            let newPlayer = try AVAudioPlayer(contentsOf: url)
            newPlayer.delegate = self
            newPlayer.prepareToPlay()
            player = newPlayer
            duration = newPlayer.duration
            currentTime = 0
            currentFile = fileName
        } catch {
            print("[AudioPlayerManager] Load error: \(error.localizedDescription)")
        }
    }

    // MARK: - Transport

    func togglePlayPause(fileName: String) {
        if currentFile != fileName { load(fileName: fileName) }
        isPlaying ? pause() : play()
    }

    func play() {
        configureSession()
        player?.play()
        isPlaying = true
        // Keep the screen awake so users can read along during a long recitation.
        UIApplication.shared.isIdleTimerDisabled = true
        startTimer()
    }

    func pause() {
        player?.pause()
        isPlaying = false
        UIApplication.shared.isIdleTimerDisabled = false
        stopTimer()
    }

    /// Skip relative to the current position, clamped to the track bounds.
    func seek(by seconds: Double) {
        guard let player = player else { return }
        let newTime = min(max(player.currentTime + seconds, 0), player.duration)
        player.currentTime = newTime
        currentTime = newTime
    }

    /// Jump to an absolute position (used by the scrubber).
    func seek(to time: Double) {
        guard let player = player else { return }
        let clamped = min(max(time, 0), player.duration)
        player.currentTime = clamped
        currentTime = clamped
    }

    /// Called when leaving the screen — stop audio and release the idle lock so
    /// we never leave the device awake after the view disappears.
    func stop() {
        pause()
        player?.stop()
        player?.currentTime = 0
        currentTime = 0
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
        isPlaying = false
        currentTime = 0
        player.currentTime = 0
        UIApplication.shared.isIdleTimerDisabled = false
        stopTimer()
    }
}
