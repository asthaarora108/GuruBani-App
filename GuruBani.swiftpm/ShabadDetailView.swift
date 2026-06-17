import SwiftUI

struct ShabadDetailView: View {
    let shabad: Shabad

    @State private var selectedLanguage: Language = .punjabi
    @State private var isAnimating = false
    @State private var isScrubbing = false

    // The audio engine is owned here (@StateObject = created once and kept alive
    // across view re-renders). Published changes redraw the scrubber.
    @StateObject private var audio = AudioPlayerManager()

    // Reader text scale persists across launches via @AppStorage (UserDefaults).
    // 1.0 == the original size; clamped to a sensible, accessible range below.
    @AppStorage("readerFontScale") private var fontScale: Double = 1.0

    var body: some View {
        ScrollView {
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea()
                LinearGradient(
                    gradient: Gradient(colors: [.orange.opacity(0.12), .yellow.opacity(0.05)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 24) {
                    title
                    audioPlayer
                    languagePicker
                    textSizeControl
                    scripture
                    Spacer()
                }
                .padding(.bottom, 40)
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { isAnimating = true }
        // Stop audio + release the wake-lock when the user navigates away.
        .onDisappear { audio.stop() }
    }

    // MARK: - Title

    private var title: some View {
        Text(shabad.title)
            .font(.system(size: 32, weight: .bold, design: .serif))
            .foregroundColor(.orange)
            .padding(.top, 20)
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : -20)
            .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.1), value: isAnimating)
    }

    // MARK: - Audio player

    private var audioPlayer: some View {
        VStack(spacing: 12) {
            HStack(spacing: 28) {
                transportButton(system: "gobackward.5", large: false) {
                    audio.seek(by: -5)
                }

                transportButton(system: audio.isPlaying ? "pause.fill" : "play.fill", large: true) {
                    audio.togglePlayPause(fileName: audioFileName)
                }

                transportButton(system: "goforward.5", large: false) {
                    audio.seek(by: 5)
                }
            }

            // Scrubber + time labels — only meaningful once a track is loaded.
            if audio.duration > 0 {
                VStack(spacing: 2) {
                    Slider(
                        value: Binding(
                            get: { audio.currentTime },
                            set: { audio.currentTime = $0 }
                        ),
                        in: 0...max(audio.duration, 0.1),
                        onEditingChanged: { editing in
                            isScrubbing = editing
                            audio.isScrubbing = editing
                            if !editing { audio.seek(to: audio.currentTime) }
                        }
                    )
                    .tint(.orange)

                    HStack {
                        Text(AudioPlayerManager.formatTime(audio.currentTime))
                        Spacer()
                        Text(AudioPlayerManager.formatTime(audio.duration))
                    }
                    .font(.caption2)
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                .transition(.opacity)
            }
        }
        .padding(.bottom, 8)
    }

    private func transportButton(system: String, large: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: system)
                .font(large ? .largeTitle : .title)
                .frame(width: large ? 60 : 44, height: large ? 60 : 44)
                .background(Color.orange)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(color: .orange.opacity(0.3), radius: 4, x: 0, y: 2)
        }
    }

    // MARK: - Language picker

    private var languagePicker: some View {
        Picker("Language", selection: $selectedLanguage) {
            ForEach(Language.allCases, id: \.self) { language in
                Text(language.rawValue).tag(language)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
        .opacity(isAnimating ? 1 : 0)
        .animation(.easeInOut.delay(0.3), value: isAnimating)
    }

    // MARK: - Text size control

    /// Accessibility win: let readers scale the scripture up/down. Persisted via
    /// @AppStorage so the choice survives across launches.
    private var textSizeControl: some View {
        HStack(spacing: 16) {
            Image(systemName: "textformat.size.smaller")
                .foregroundColor(.secondary)

            Slider(value: $fontScale, in: 0.8...1.8, step: 0.1)
                .tint(.orange)

            Image(systemName: "textformat.size.larger")
                .foregroundColor(.secondary)
        }
        .font(.footnote)
        .padding(.horizontal)
    }

    // MARK: - Scripture

    private var scripture: some View {
        // Base size differs by language (Gurmukhi reads better a touch larger),
        // then multiplied by the user's persisted scale.
        let base: CGFloat = selectedLanguage == .punjabi ? 24 : 20
        return Text(content)
            .font(.system(size: base * fontScale, design: .serif))
            .padding()
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.secondarySystemGroupedBackground))
                    .shadow(color: .black.opacity(0.12), radius: 10, x: 0, y: 5)
            )
            .padding(.horizontal)
            .opacity(isAnimating ? 1 : 0)
            .scaleEffect(isAnimating ? 1 : 0.9)
            .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.4), value: isAnimating)
            // Smoothly animate font-size changes.
            .animation(.easeInOut(duration: 0.2), value: fontScale)
    }

    // MARK: - Helpers

    private var content: String {
        switch selectedLanguage {
        case .punjabi:  return shabad.punjabi
        case .hinglish: return shabad.hinglish
        case .english:  return shabad.english
        }
    }

    /// Maps a bani title to its bundled audio resource name.
    private var audioFileName: String {
        switch shabad.title {
        case "Mool Mantar":      return "mool_mantar"
        case "Japji Sahib":      return "japji_sahib"
        case "So Dar (Rehras)":  return "so_dar"
        case "Sohila":           return "sohila"
        default:                  return ""
        }
    }
}
