import SwiftUI

struct ContentView: View {
    let shabads = Shabad.allShabads
    @State private var isAnimating = false

    var body: some View {
        // NavigationStack replaces the deprecated NavigationView (iOS 16+).
        // It's the modern, App-Store-future-proof container and avoids the
        // unwanted split-view behaviour NavigationView shows on iPad.
        NavigationStack {
            ZStack {
                // Semantic background keeps the screen readable in BOTH light and
                // dark mode; the warm gradient now sits *over* the system surface
                // instead of forcing a hardcoded white base.
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                LinearGradient(
                    gradient: Gradient(colors: [.orange.opacity(0.12), .yellow.opacity(0.05)]),
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
                        ForEach(Array(shabads.enumerated()), id: \.element.id) { index, shabad in
                            NavigationLink(destination: ShabadDetailView(shabad: shabad)) {
                                row(for: shabad)
                            }
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.secondarySystemGroupedBackground))
                                    .padding(.vertical, 4)
                                    .shadow(color: .black.opacity(0.06), radius: 3, x: 0, y: 1)
                            )
                            .opacity(isAnimating ? 1 : 0)
                            .offset(x: isAnimating ? 0 : -50)
                            // Drive the stagger off the loop index instead of
                            // searching the array each frame — cleaner and avoids
                            // a force-unwrap.
                            .animation(.spring(response: 0.5, dampingFraction: 0.8)
                                .delay(Double(index) * 0.1), value: isAnimating)
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden) // let our gradient show through
            }
            .navigationTitle("Guru Granth Sahib Ji")
            .onAppear { isAnimating = true }
        }
    }

    // MARK: - Row

    @ViewBuilder
    private func row(for shabad: Shabad) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon(for: shabad.title))
                .font(.title2)
                .foregroundColor(.orange)
                .frame(width: 36, height: 36)
                .background(Color.orange.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 6) {
                Text(shabad.title)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(shabad.punjabi)
                    .font(.system(.subheadline, design: .serif))
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 8)
    }

    /// A simple, meaningful SF Symbol per bani. Falls back to a book glyph so a
    /// newly-added bani still renders sensibly.
    private func icon(for title: String) -> String {
        switch title {
        case "Mool Mantar":      return "sun.max.fill"
        case "Japji Sahib":      return "sunrise.fill"
        case "So Dar (Rehras)":  return "sunset.fill"
        case "Sohila":           return "moon.stars.fill"
        default:                  return "book.closed.fill"
        }
    }
}
