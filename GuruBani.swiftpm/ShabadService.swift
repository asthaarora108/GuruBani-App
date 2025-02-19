//
//  File.swift
//  EkamBani
//
//  Created by Astha on 11/02/25.
//

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
        // Since the JSON file is removed, we can return an empty array
        return [] // Return an empty array instead of trying to load from a file
    }
}

