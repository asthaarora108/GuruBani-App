import SwiftUI
import Foundation

struct ContentView: View {
    @State private var searchText = ""
       @State private var shabads: [Shabad] = []
       
       var filteredShabads: [Shabad] {
           if searchText.isEmpty {
               return shabads
           } else {
               return shabads.filter {
                   $0.content.localizedCaseInsensitiveContains(searchText)
               }
           }
       }
       
       var body: some View {
           NavigationView {
               List {
                   ForEach(filteredShabads) { shabad in
                       VStack(alignment: .leading, spacing: 10) {
                           Text("Page \(shabad.page)")
                               .font(.headline)
                               .foregroundColor(.blue)
                           Text(shabad.content)
                               .font(.body)
                               .multilineTextAlignment(.leading)
                       }
                       .padding(.vertical, 8)
                   }
               }
               .searchable(text: $searchText, prompt: "Search Guru Granth Sahib Ji")
               .navigationTitle("Guru Granth Sahib Ji")
           }
           .onAppear {
               if shabads.isEmpty {
                   shabads = ShabadService.loadShabads()
                   print("Loaded \(shabads.count) shabads")
               }
           }
       }
   }
