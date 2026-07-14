import SwiftUI

struct ShabadDetailView: View {
    let shabad: Shabad

    @State private var isAnimating = false
    @State private var isScrubbing = false

    // The audio engine is owned here (@StateObject = created once and kept alive
    // across view re-renders). Published changes redraw the scrubber.
    @StateObject private var audio = AudioPlayerManager()

    // Both reading preferences persist across launches via @AppStorage.
    @AppStorage("readingMode") private var readingModeRaw = ReadingMode.study.rawValue
    @AppStorage("readerFontScale") private var fontScale: Double = 1.0

    /// Study mode needs aligned sources; fall back to Gurmukhi when this
    /// bani's translations don't line up stanza-for-stanza.
    private var mode: ReadingMode {
        let stored = ReadingMode(rawValue: readingModeRaw) ?? .gurmukhi
        return (stored == .study && !shabad.isAligned) ? .gurmukhi : stored
    }

    private var availableModes: [ReadingMode] {
        shabad.isAligned ? ReadingMode.allCases : [.gurmukhi, .roman, .meaning]
    }

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            LinearGradient(
                gradient: Gradient(colors: [.orange.opacity(0.12), .yellow.opacity(0.05)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                LazyVStack(spacing: 14) {
                    header
                    modePicker

                    if mode == .study {
                        ForEach(shabad.gurmukhi) { block in
                            studyCard(for: block)
                        }
                    } else {
                        ForEach(shabad.blocks(for: mode)) { block in
                            blockCard(for: block)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .frame(maxWidth: 700)
                .frame(maxWidth: .infinity)
            }
        }
        .safeAreaInset(edge: .bottom) { playerBar }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) { fontSizeMenu }
        }
        .onAppear { isAnimating = true }
        // Stop audio + release the wake-lock when the user navigates away.
        .onDisappear { audio.stop() }
    }

    // MARK: - Header

    private var header: some View {
        VStack(spacing: 4) {
            Text(shabad.gurmukhiTitle)
                .font(.system(size: 32, weight: .bold, design: .serif))
                .foregroundColor(.orange)

            Text("\(shabad.title)  ·  \(shabad.subtitle)")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding(.top, 12)
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -16)
        .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.05), value: isAnimating)
    }

    // MARK: - Mode picker

    private var modePicker: some View {
        // Bind to the *effective* mode so a bani without Study support still
        // shows a selected segment when the stored preference is Study.
        Picker("Reading mode", selection: Binding(
            get: { mode.rawValue },
            set: { readingModeRaw = $0 }
        )) {
            ForEach(availableModes) { mode in
                Text(mode.rawValue).tag(mode.rawValue)
            }
        }
        .pickerStyle(.segmented)
        .padding(.bottom, 6)
    }

    // MARK: - Single-language stanza card

    private func blockCard(for block: LanguageBlock) -> some View {
        VStack(spacing: 10) {
            markerBadge(block.marker)

            if mode == .meaning {
                Text(block.text)
                    .font(.system(size: 17 * fontScale, design: .serif))
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                ForEach(Array(block.lines.enumerated()), id: \.offset) { _, line in
                    Text(line)
                        .font(.system(size: (mode == .gurmukhi ? 23 : 18) * fontScale,
                                      design: .serif))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(18)
        .background(cardBackground)
        .animation(.easeInOut(duration: 0.2), value: fontScale)
    }

    // MARK: - Study card (all three languages, stanza by stanza)

    /// Safe because `isAligned` guarantees the three arrays share the same
    /// length and marker sequence.
    private func studyCard(for block: LanguageBlock) -> some View {
        let index = block.id - 1
        let translit = shabad.translit[index]
        let english = shabad.english[index]

        return VStack(alignment: .leading, spacing: 12) {
            markerBadge(block.marker)
                .frame(maxWidth: .infinity)

            VStack(alignment: .leading, spacing: 6) {
                ForEach(Array(block.lines.enumerated()), id: \.offset) { _, line in
                    Text(line)
                        .font(.system(size: 21 * fontScale, design: .serif))
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                ForEach(Array(translit.lines.enumerated()), id: \.offset) { _, line in
                    Text(line)
                        .font(.system(size: 15 * fontScale))
                        .italic()
                        .foregroundColor(.orange)
                }
            }

            Divider()

            Text(english.text)
                .font(.system(size: 15 * fontScale))
                .foregroundColor(.secondary)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(cardBackground)
        .animation(.easeInOut(duration: 0.2), value: fontScale)
    }

    // MARK: - Card chrome

    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color(.secondarySystemGroupedBackground))
            .shadow(color: .black.opacity(0.07), radius: 6, x: 0, y: 3)
    }

    /// Pauri number chip. Gurmukhi mode keeps the authentic ॥੧॥ inside the
    /// text itself, so the chip only shows where the marker was stripped.
    @ViewBuilder
    private func markerBadge(_ marker: String?) -> some View {
        if let marker, mode != .gurmukhi {
            Text("॥ \(marker) ॥")
                .font(.caption.weight(.bold))
                .foregroundColor(.orange)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(Capsule().fill(Color.orange.opacity(0.12)))
        }
    }

    // MARK: - Font size menu

    private var fontSizeMenu: some View {
        Menu {
            Button {
                fontScale = min(1.8, fontScale + 0.1)
            } label: {
                Label("Larger", systemImage: "textformat.size.larger")
            }
            Button {
                fontScale = max(0.8, fontScale - 0.1)
            } label: {
                Label("Smaller", systemImage: "textformat.size.smaller")
            }
            Button("Reset") { fontScale = 1.0 }
        } label: {
            Image(systemName: "textformat.size")
        }
    }

    // MARK: - Floating audio bar

    private var playerBar: some View {
        VStack(spacing: 10) {
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
            }

            HStack {
                speedMenu
                    .frame(width: 56, alignment: .leading)

                Spacer()

                HStack(spacing: 26) {
                    transportButton(system: "gobackward.5", large: false) {
                        audio.seek(by: -5)
                    }
                    transportButton(system: audio.isPlaying ? "pause.fill" : "play.fill",
                                    large: true) {
                        audio.togglePlayPause(fileName: shabad.audioFileName,
                                              title: shabad.title)
                    }
                    transportButton(system: "goforward.5", large: false) {
                        audio.seek(by: 5)
                    }
                }

                Spacer()

                // invisible twin of the speed menu keeps the transport centred
                speedMenu
                    .frame(width: 56)
                    .hidden()
            }
        }
        .padding(14)
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 22))
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .strokeBorder(Color.orange.opacity(0.2))
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 6)
        .frame(maxWidth: 700)
    }

    /// Slower speeds help learners follow the Gurmukhi word by word.
    private var speedMenu: some View {
        Menu {
            Picker("Speed", selection: $audio.playbackRate) {
                Text("0.75×").tag(Float(0.75))
                Text("1×").tag(Float(1.0))
                Text("1.25×").tag(Float(1.25))
                Text("1.5×").tag(Float(1.5))
            }
        } label: {
            Text(speedLabel)
                .font(.footnote.weight(.semibold))
                .foregroundColor(.orange)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Capsule().fill(Color.orange.opacity(0.12)))
        }
    }

    private var speedLabel: String {
        audio.playbackRate == 1.0
            ? "1×"
            : String(format: "%g×", audio.playbackRate)
    }

    private func transportButton(system: String, large: Bool,
                                 action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: system)
                .font(large ? .title : .title3)
                .frame(width: large ? 56 : 42, height: large ? 56 : 42)
                .background(Color.orange)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(color: .orange.opacity(0.3), radius: 4, x: 0, y: 2)
        }
    }
}
