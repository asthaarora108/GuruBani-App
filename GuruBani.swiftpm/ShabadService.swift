//
//  File.swift
//  EkamBani
//
//  Created by Astha on 11/02/25.
//

import Foundation

class ShabadService {
    static func loadShabads() -> [Shabad] {
        
        print("Current working directory: \(FileManager.default.currentDirectoryPath)")
        
      
        print("Main bundle path: \(Bundle.main.bundlePath)")
        print("Main bundle URL: \(Bundle.main.bundleURL)")
        
        
        print("\nListing all files in bundle:")
        if let enumerator = FileManager.default.enumerator(atPath: Bundle.main.bundlePath) {
            for case let path as String in enumerator {
                print("Found: \(path)")
            }
        }
        
        if let jsonPath = Bundle.main.path(forResource: "converted", ofType: "json") {
            print("\nFound JSON at path: \(jsonPath)")
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: jsonPath))
                print("Successfully read \(data.count) bytes")
                
                
                if let preview = String(data: data.prefix(100), encoding: .utf8) {
                    print("First 100 characters: \(preview)")
                }
                
                let decoder = JSONDecoder()
                let pages = try decoder.decode([ShabadPage].self, from: data)
                print("Successfully decoded \(pages.count) pages")
                return pages.map { Shabad(page: $0.page, content: $0.content) }
            } catch {
                print("Error reading/decoding JSON: \(error)")
                return []
            }
        } else {
            print("\nCouldn't find converted.json in bundle")
            
            let alternateURLs = [
                Bundle.main.bundleURL.appendingPathComponent("converted.json"),
                Bundle.main.bundleURL.appendingPathComponent("Resources/converted.json"),
                Bundle.main.bundleURL.appendingPathComponent("AppModule_AppModule.bundle/converted.json")
            ]
            
            print("\nTrying alternate paths:")
            for url in alternateURLs {
                print("Checking \(url.path)")
                if FileManager.default.fileExists(atPath: url.path) {
                    print("Found file at: \(url.path)")
                }
            }
            
            return []
        }
    }

    static func loadShabadsFromDocuments() -> [Shabad] {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let jsonURL = documentsPath.appendingPathComponent("converted.json")
        
        do {
            let data = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            let pages = try decoder.decode([ShabadPage].self, from: data)
            return pages.map { Shabad(page: $0.page, content: $0.content) }
        } catch {
            print("Error loading from documents: \(error)")
            return []
        }
    }
}

