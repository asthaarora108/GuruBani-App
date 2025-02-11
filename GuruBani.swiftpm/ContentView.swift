import SwiftUI
import Foundation

struct Shabad: Identifiable {
    let id: Int
    let ang: Int
    let gurmukhi: String
    let hinglish: String
    let english: String
}

let shabads: [Shabad] = [
    Shabad(id: 1, ang: 1, gurmukhi: "ੴ ਸਤਿ ਨਾਮੁ ਕਰਤਾ ਪੁਰਖੁ", hinglish: "Ik Onkar Satnam Karta Purakh", english: "There is One God, whose name is True, the Creator"),
    Shabad(id: 2, ang: 2, gurmukhi: "ਸਿਮਰਨ ਦੀ ਪਰਮੇਸਾ", hinglish: "Simran Parmaisa", english: "Remembering God brings peace")
]


struct ContentView: View {
    @State private var searchText = ""
    
    var filteredShabads: [Shabad] {
        if searchText.isEmpty {
            return shabads
        } else {
            return shabads.filter { $0.gurmukhi.contains(searchText) || $0.hinglish.contains(searchText) || $0.english.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredShabads) { shabad in
                VStack(alignment: .leading) {
                    Text("Ang \(shabad.ang)")
                        .font(.headline)
                        .foregroundColor(.blue)
                    Text(shabad.gurmukhi)
                        .font(.title2)
                    Text(shabad.hinglish)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(shabad.english)
                        .font(.body)
                        .italic()
                }
                .padding()
            }
            .searchable(text: $searchText, prompt: "Search Guru Granth Sahib Ji")
            .navigationTitle("Guru Granth Sahib Ji")
        }
    }
}


