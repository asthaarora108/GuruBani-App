import Foundation


struct ShabadPage: Codable {
    let page: Int
    let content: String
}

class ShabadService {
    static func loadShabads() -> [Shabad] {
        return Shabad.allShabads
    }

    static func loadShabadsFromDocuments() -> [Shabad] {
        return [] 
    }
}

