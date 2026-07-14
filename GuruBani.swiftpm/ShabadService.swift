import Foundation
import os

class ShabadService {
    private static let log = Logger(subsystem: "GuruBani", category: "data")

    static func loadShabads() -> [Shabad] {
        let shabads = Shabad.allShabads
        log.debug("loadShabads() -> \(shabads.count) banis")
        return shabads
    }
}
