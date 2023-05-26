//  ShoppingListView.swift
//  listadelacomprapp
//  Created by Losark on 26/5/23.


import SwiftUI

struct ShoppingListView: View {
//    @StateObject private var viewModel = ViewModel()
    @ObservedObject var shoppingList = ShoppingListViewModel(products: [ProductModel(name: "Pan"), ProductModel(name: "Agua")])
    
    @State private var newProductName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(shoppingList.products) { product in
                        ShoppingListRow(product: product, togglePurchase: {
                            shoppingList.togglePurchase(for: product)
                        })
                    }
                    .onDelete(perform: deleteProduct)
                }
                
                HStack {
                    TextField("Nombre del producto", text: $newProductName)
                    Button(action: addProduct) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                    }
                }
                .padding()
            }
            .navigationTitle("Lista de Compra")
        }
    }
    
    private func addProduct() {
        if !newProductName.isEmpty {
            shoppingList.addProduct(newProductName)
            newProductName = ""
        }
    }
    
    private func deleteProduct(at offsets: IndexSet) {
        shoppingList.removeProduct(shoppingList.products[offsets.first!])
    }
}

struct ShoppingListRow: View {
    let product: ProductModel
    let togglePurchase: () -> Void
    
    var body: some View {
        HStack {
            Button(action: togglePurchase) {
                Image(systemName: product.isPurchased ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(product.isPurchased ? .green : .primary)
            }
            Text(product.name)
                .strikethrough(product.isPurchased)
        }
    }
}


struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}
