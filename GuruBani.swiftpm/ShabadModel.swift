import Foundation

/// When during the day a bani is traditionally recited. Drives the
/// time-aware "Now" hero card on the home screen.
enum TimeOfDay: String {
    case anytime
    case morning
    case evening
    case night
}

/// How the reader wants the scripture presented.
/// `study` interleaves all three languages stanza-by-stanza and is only
/// offered for banis whose sources align (`Shabad.isAligned`).
enum ReadingMode: String, CaseIterable, Identifiable {
    case gurmukhi = "ਗੁਰਮੁਖੀ"
    case roman = "Roman"
    case meaning = "Meaning"
    case study = "Study"

    var id: String { rawValue }
}

/// One stanza (pauri) of a bani in a single language.
/// `marker` is the pauri number from the source text ("1", "2", …), nil for
/// unnumbered sections like the opening invocation. `text` holds display
/// lines separated by \n.
struct LanguageBlock: Identifiable, Hashable {
    let id: Int
    let marker: String?
    let text: String

    var lines: [String] { text.components(separatedBy: "\n") }
}

struct Shabad: Identifiable {
    let id: Int
    let title: String
    let gurmukhiTitle: String
    let subtitle: String
    let timeOfDay: TimeOfDay
    let audioFileName: String
    let durationMinutes: Int
    /// True when the numbered markers of all three sources line up, making
    /// the interleaved Study mode safe to offer.
    let isAligned: Bool
    let gurmukhi: [LanguageBlock]
    let translit: [LanguageBlock]
    let english: [LanguageBlock]

    /// First Gurmukhi line, used as the row preview on the home screen.
    var preview: String { gurmukhi.first?.lines.first ?? "" }

    func blocks(for mode: ReadingMode) -> [LanguageBlock] {
        switch mode {
        case .gurmukhi, .study: return gurmukhi
        case .roman: return translit
        case .meaning: return english
        }
    }
}
