import SwiftUI

struct ShabadDetailView: View {
    let shabad: Shabad
    @State private var selectedLanguage: Language = .punjabi
    
    var body: some View {
        VStack(spacing: 20) {
            Text(shabad.title)
                .font(.largeTitle)
                .padding()
            
            Picker("Language", selection: $selectedLanguage) {
                ForEach(Language.allCases, id: \.self) { language in
                    Text(language.rawValue).tag(language)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            ScrollView {
                Text(content)
                    .font(.title2)
                    .padding()
                    .multilineTextAlignment(.center)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
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