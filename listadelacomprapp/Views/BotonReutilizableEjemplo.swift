//
//  TestButton.swift
//  listadelacomprapp
//
//  Created by Losark on 27/5/23.
//

import SwiftUI

struct BotonReutilizableEjemplo: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text("Ejemplo de Botón reutilizable")
        }
    }
}
