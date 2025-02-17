//
//  File.swift
//  EkamBani
//
//  Created by Astha on 11/02/25.
//

import Foundation

// First define the ShabadPage structure
struct ShabadPage: Codable {
    let page: Int
    let content: String
}

class ShabadService {
    static func loadShabads() -> [Shabad] {
        return Shabad.allShabads
    }

    static func loadShabadsFromDocuments() -> [Shabad] {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let jsonURL = documentsPath.appendingPathComponent("converted.json")
        
        do {
            let data = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            let pages = try decoder.decode([ShabadPage].self, from: data)
            
            // Convert ShabadPage to Shabad with proper initialization
            return pages.enumerated().map { index, page in
                Shabad(
                    id: index + 1,
                    title: "Page \(page.page)",
                    punjabi: page.content,
                    hinglish: "", // You might want to add proper translations
                    english: ""   // You might want to add proper translations
                )
            }
        } catch {
            print("Error loading from documents: \(error)")
            return []
        }
    }
}

