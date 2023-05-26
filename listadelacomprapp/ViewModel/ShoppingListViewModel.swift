//  ShoppingListViewModel.swift
//  listadelacomprapp
//  Created by Losark on 26/5/23.


import Foundation

class ShoppingListViewModel: ObservableObject {
//    @Published var products = [ProductModel]()
    @Published var products = [ProductModel(name: "Pan2"), ProductModel(name: "Agua2")]
    
    init(products: [ProductModel]) {
        self.products = products
    }
    
    func addProduct(_ name: String) {
        let product = ProductModel(name: name)
        products.append(product)
        save()
    }
    
    func removeProduct(_ product: ProductModel) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
            save()
        }
    }
    
    func togglePurchase(for product: ProductModel) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].isPurchased.toggle()
            save()
        }
    }
    
    private func save() {
        // Implementa aquí la lógica para guardar la lista de compras (por ejemplo, en UserDefaults o en una base de datos)
    }
}
