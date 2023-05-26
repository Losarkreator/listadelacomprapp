//  ContentView.swift
//  listadelacomprapp
//  Created by Losark on 26/5/23.

import Foundation

// Decodable?
struct Product: Codable, Identifiable {
    var id = UUID()
    var name: String
    var isPurchased: Bool = false
}
