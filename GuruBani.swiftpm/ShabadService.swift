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
        return [] 
    }
}

