import SwiftUI

struct ContentView: View {
    let shabads = Shabad.allShabads
    @State private var isAnimating = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.orange.opacity(0.1), .yellow.opacity(0.05)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                List {
                    Section(header: Text("Nitnem Banis")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .padding(.vertical, 8)) {
                        ForEach(shabads) { shabad in
                            NavigationLink(destination: ShabadDetailView(shabad: shabad)) {
                                VStack(alignment: .leading, spacing: 12) {
                                    Text(shabad.title)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    
                                    Text(shabad.punjabi)
                                        .font(.system(.subheadline, design: .serif))
                                        .foregroundColor(.secondary)
                                        .lineLimit(2)
                                        .padding(.vertical, 4)
                                }
                                .padding(.vertical, 8)
                            }
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.white, .orange.opacity(0.05)]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .padding(.vertical, 4)
                                    .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 1)
                            )
                            .opacity(isAnimating ? 1 : 0)
                            .offset(x: isAnimating ? 0 : -50)
                            .animation(.spring(response: 0.5, dampingFraction: 0.8).delay(Double(shabads.firstIndex(where: { $0.id == shabad.id })!) * 0.1), value: isAnimating)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Guru Granth Sahib Ji")
            .onAppear {
                isAnimating = true
            }
        }
    }
}
