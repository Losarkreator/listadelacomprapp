//  ShoppingListView.swift
//  listadelacomprapp
//  Created by Losark on 26/5/23.


import SwiftUI

struct ShoppingListView: View {
//    @StateObject private var viewModel = ViewModel()
    @ObservedObject var shoppingList = ShoppingListViewModel(products: [ProductModel(name: "Pan"), ProductModel(name: "Agua")])
    
    @State private var newProductName = ""
    @State private var isAddButtonVisible = true
    private let sizeButton = 50.0
    
    var body: some View {
        NavigationView {
            VStack {
                
                //MARK: - Lista
                List {
                    ForEach(shoppingList.products) { product in
                        ShoppingListRow(product: product, togglePurchase: {
                            shoppingList.togglePurchase(for: product)
                        })
                    }
                    .onDelete(perform: deleteProduct)
                }
                
                //MARK: - Boton Añadir
                VStack {
                    if isAddButtonVisible {
                        Button(action: {
                            isAddButtonVisible = false
                        }) {
                            Spacer()
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: sizeButton, height: sizeButton)
                        }
                    } else {
                        HStack {
                            TextField("Nombre del producto", text: $newProductName)
                            Button(action: {
                                //TODO: cambiar para que el comportamiento sea al clicar fuera
                                isAddButtonVisible = true
                                addProduct()
                                
                            }) {
//                                Image(systemName: "plus.circle.fill")
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .frame(width: sizeButton, height: sizeButton)
                                    .foregroundColor(.green)
                            }
                        }
                        .padding()
                    }
                }
                .padding(.horizontal, 30.0)
                
            }
            .navigationTitle("Comprar:")
        }
    }
    
    
    //MARK: - Funciones
    //TODO: Mover al ViewModel ?
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
            Text(product.name)
                .font(.title2)
                .strikethrough(product.isPurchased)

            Spacer()
            
            Button(action: togglePurchase) {
                Image(systemName: product.isPurchased ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(product.isPurchased ? .green : .primary)
            }
        }
    }
}


struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}
