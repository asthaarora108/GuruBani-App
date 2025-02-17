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
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let jsonURL = documentsPath.appendingPathComponent("converted.json")
        
        do {
            let data = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            let pages = try decoder.decode([ShabadPage].self, from: data)
            
            return pages.enumerated().map { index, page in
                Shabad(
                    id: index + 1,
                    title: "Page \(page.page)",
                    punjabi: page.content,
                    hinglish: "",
                    english: ""
                )
            }
        } catch {
            print("Error loading from documents: \(error)")
            return []
        }
    }
}

