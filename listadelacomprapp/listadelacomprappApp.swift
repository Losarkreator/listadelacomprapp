//
//  listadelacomprappApp.swift
//  listadelacomprapp
//
//  Created by Losark on 26/5/23.
//

import SwiftUI

@main
struct listadelacomprappApp: App {
    var body: some Scene {
        WindowGroup {
            ShoppingListView(shoppingList:  ShoppingListViewModel(products: [Product(name: "Pan"), Product(name: "Agua")]))
        }
    }
}
