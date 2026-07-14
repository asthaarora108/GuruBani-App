import SwiftUI

struct ContentView: View {
    let shabads = ShabadService.loadShabads()
    @State private var isAnimating = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                LinearGradient(
                    gradient: Gradient(colors: [.orange.opacity(0.14), .yellow.opacity(0.05)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 26) {
                        header
                        heroCard
                        baniList
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    .padding(.bottom, 32)
                    .frame(maxWidth: 700)          // keeps iPad layouts readable
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("ਗੁਰਬਾਣੀ")
                        .font(.system(.headline, design: .serif))
                        .foregroundColor(.orange)
                }
            }
            .onAppear { isAnimating = true }
        }
    }

    // MARK: - Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(Date.now.formatted(.dateTime.weekday(.wide).day().month(.wide)))
                .font(.caption)
                .fontWeight(.semibold)
                .textCase(.uppercase)
                .foregroundColor(.secondary)

            Text(greeting)
                .font(.system(size: 30, weight: .bold, design: .serif))
                .foregroundColor(.primary)

            Text("Waheguru Ji Ka Khalsa, Waheguru Ji Ki Fateh")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .opacity(isAnimating ? 1 : 0)
        .animation(.easeOut(duration: 0.5), value: isAnimating)
    }

    private var greeting: String {
        switch Calendar.current.component(.hour, from: .now) {
        case 4..<11:  return "Good Morning"
        case 11..<17: return "Good Afternoon"
        case 17..<21: return "Good Evening"
        default:      return "Good Night"
        }
    }

    // MARK: - Hero card

    /// The bani traditionally recited at this hour, surfaced front and centre
    /// so daily Nitnem is one tap away.
    private var recommended: Shabad {
        let hour = Calendar.current.component(.hour, from: .now)
        let slot: TimeOfDay
        switch hour {
        case 4..<11:  slot = .morning
        case 11..<17: slot = .anytime
        case 17..<21: slot = .evening
        default:      slot = .night
        }
        return shabads.first { $0.timeOfDay == slot } ?? shabads[0]
    }

    private var heroCard: some View {
        NavigationLink(destination: ShabadDetailView(shabad: recommended)) {
            VStack(alignment: .leading, spacing: 14) {
                HStack {
                    Label("Now · \(recommended.subtitle)", systemImage: icon(for: recommended))
                        .font(.caption)
                        .fontWeight(.bold)
                        .textCase(.uppercase)

                    Spacer()

                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 40))
                }
                .foregroundColor(.white.opacity(0.95))

                VStack(alignment: .leading, spacing: 4) {
                    Text(recommended.gurmukhiTitle)
                        .font(.system(size: 34, weight: .bold, design: .serif))

                    Text("\(recommended.title)  ·  \(recommended.durationMinutes) min")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.85))
                }
                .foregroundColor(.white)
            }
            .padding(22)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                LinearGradient(
                    colors: [Color(red: 1.0, green: 0.58, blue: 0.1),
                             Color(red: 0.93, green: 0.35, blue: 0.14)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .shadow(color: .orange.opacity(0.35), radius: 14, x: 0, y: 6)
        }
        .buttonStyle(.plain)
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 24)
        .animation(.spring(response: 0.55, dampingFraction: 0.8).delay(0.1), value: isAnimating)
    }

    // MARK: - Bani list

    private var baniList: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Nitnem Banis")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.orange)

            ForEach(Array(shabads.enumerated()), id: \.element.id) { index, shabad in
                NavigationLink(destination: ShabadDetailView(shabad: shabad)) {
                    row(for: shabad)
                }
                .buttonStyle(.plain)
                .opacity(isAnimating ? 1 : 0)
                .offset(x: isAnimating ? 0 : -50)
                .animation(.spring(response: 0.5, dampingFraction: 0.8)
                    .delay(0.15 + Double(index) * 0.08), value: isAnimating)
            }
        }
    }

    private func row(for shabad: Shabad) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon(for: shabad))
                .font(.title2)
                .foregroundColor(.orange)
                .frame(width: 44, height: 44)
                .background(Color.orange.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 4) {
                Text(shabad.title)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text("\(shabad.subtitle)  ·  \(shabad.durationMinutes) min")
                    .font(.caption)
                    .foregroundColor(.orange)

                Text(shabad.preview)
                    .font(.system(.subheadline, design: .serif))
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.footnote.weight(.semibold))
                .foregroundColor(.secondary.opacity(0.6))
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.secondarySystemGroupedBackground))
                .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 2)
        )
    }

    /// Icon follows the bani's time of day, so a newly added bani gets a
    /// sensible glyph automatically.
    private func icon(for shabad: Shabad) -> String {
        switch shabad.timeOfDay {
        case .morning: return "sunrise.fill"
        case .evening: return "sunset.fill"
        case .night:   return "moon.stars.fill"
        case .anytime: return "sun.max.fill"
        }
    }
}
