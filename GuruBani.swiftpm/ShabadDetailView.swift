import SwiftUI
import AVFoundation

struct ShabadDetailView: View {
    let shabad: Shabad
    @State private var selectedLanguage: Language = .punjabi
    @State private var isAnimating = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlaying = false
    
    var body: some View {
        ScrollView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.orange.opacity(0.1), .yellow.opacity(0.05)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    Text(shabad.title)
                        .font(.system(size: 32, weight: .bold, design: .serif))
                        .foregroundColor(.orange)
                        .padding(.top, 20)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -20)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.1), value: isAnimating)
                    
                    Picker("Language", selection: $selectedLanguage) {
                        ForEach(Language.allCases, id: \.self) { language in
                            Text(language.rawValue).tag(language)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut.delay(0.3), value: isAnimating)
                    
                    Text(content)
                        .font(.system(size: selectedLanguage == .punjabi ? 24 : 20, design: .serif))
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.white, .orange.opacity(0.1)]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 5)
                        )
                        .padding(.horizontal)
                        .opacity(isAnimating ? 1 : 0)
                        .scaleEffect(isAnimating ? 1 : 0.9)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.4), value: isAnimating)

                    Spacer()
                    Button(action: {
                        if isPlaying {
                            audioPlayer?.pause()
                        } else {
                            playAudio(for: shabad.title)
                        }
                        isPlaying.toggle()
                    }) {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.largeTitle)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut.delay(0.3), value: isAnimating)
                }
                .padding(.bottom, 40)
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            isAnimating = true
        }
        .onChange(of: selectedLanguage) { _ in
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            }
        }
    }
    private func playAudio(for title: String) {
        let audioFileName: String
        switch title {
        case "Mool Mantar":
            audioFileName = "mool_mantar"
        case "Japji Sahib":
            audioFileName = "japji_sahib"
        case "So Dar (Rehras)":
            audioFileName = "so_dar"
        case "Sohila":
            audioFileName = "sohila"
        default:
            return
        }
        
        guard let url = Bundle.main.url(forResource: audioFileName, withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    private var content: String {
        switch selectedLanguage {
        case .punjabi:
            return shabad.punjabi
        case .hinglish:
            return shabad.hinglish
        case .english:
            return shabad.english
        }
    }
} 
