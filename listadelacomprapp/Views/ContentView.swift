//  ContentView.swift
//  listadelacomprapp
//  Created by Losark on 26/5/23.


import SwiftUI

struct ContentView: View {
    @State private var products = ["Manzanas", "Plátanos", "Leche", "Pan"]
    @State private var newProduct = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0..<products.count, id: \.self) { index in
                        HStack {
                            Button(action: {
                                self.toggleProduct(at: index)
                            }) {
                                Image(systemName: self.products[index].contains("✓") ? "checkmark.square.fill" : "square")
                                    .foregroundColor(.blue)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Text(self.products[index])
                        }
                    }
                    .onDelete(perform: deleteProduct)
                }
                .navigationBarTitle("Lista de Compra")
                
                HStack {
                    TextField("Nuevo producto", text: $newProduct)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        self.addProduct()
                    }) {
                        Text("Añadir")
                    }
                }
                .padding()
            }
        }
    }
    
    func toggleProduct(at index: Int) {
        if products[index].contains("✓") {
            products[index] = products[index].replacingOccurrences(of: "✓ ", with: "")
        } else {
            products[index] = "✓ " + products[index]
        }
    }
    
    func deleteProduct(at offsets: IndexSet) {
        products.remove(atOffsets: offsets)
    }
    
    func addProduct() {
        if !newProduct.isEmpty {
            products.append(newProduct)
            newProduct = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
