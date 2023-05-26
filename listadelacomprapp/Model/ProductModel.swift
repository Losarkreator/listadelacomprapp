//  ContentView.swift
//  listadelacomprapp
//  Created by Losark on 26/5/23.

import Foundation

struct ProductModel: Codable, Identifiable {
    var id = UUID()
    var name: String
    var isPurchased: Bool = false
}
