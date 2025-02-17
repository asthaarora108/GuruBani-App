import SwiftUI

struct ContentView: View {
    let shabads = Shabad.allShabads
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Nitnem Banis")) {
                    ForEach(shabads) { shabad in
                        NavigationLink(destination: ShabadDetailView(shabad: shabad)) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(shabad.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                Text(shabad.punjabi)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Guru Granth Sahib Ji")
            .listStyle(InsetGroupedListStyle())
        }
    }
}
