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

struct Shabad: Codable, Identifiable {
    var id: Int { page } 
    let page: Int
    let content: String
} 
