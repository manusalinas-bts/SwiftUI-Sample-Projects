//
//  SumButton.swift
//  BindingApp
//
//  Created by Manuel Salinas on 7/24/23.
//

import SwiftUI

struct SumButton: View {
    @Binding var counter: Int
    
    var body: some View {
        Button {
            sumarUno()
        } label: {
            Text("Sumar")
        }
        .buttonStyle(.bordered)
        .tint(.brown)
        .font(.largeTitle)
    }
    
    private func sumarUno() {
        counter += 1
    }
}

struct SumButton_Previews: PreviewProvider {
    static var previews: some View {
        SumButton(counter: .constant(0))
    }
}
