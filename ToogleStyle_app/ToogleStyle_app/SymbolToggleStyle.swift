//
//  SymbolToggleStyle.swift
//
//  Created by Manuel Salinas on 8/1/23.
//

import SwiftUI

struct SymbolToggleStyle: ToggleStyle {
    var systemImage: String = "checkmark"
    var activeColor: Color = .green
    var rotateAnimation: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 30)
                .fill(configuration.isOn ? activeColor : Color(.systemGray5))
                .overlay {
                    Circle()
                        .fill(.white)
                        .padding(3)
                        .overlay {
                            Image(systemName: systemImage)
                                .foregroundColor(configuration.isOn ? activeColor : Color(.systemGray5))
                        }
                        .rotationEffect(rotateAnimation ? .degrees(configuration.isOn ? 0 : -360) : .zero)
                        .offset(x: configuration.isOn ? 10 : -10)
                    
                }
                .frame(width: 50, height: 32)
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}
