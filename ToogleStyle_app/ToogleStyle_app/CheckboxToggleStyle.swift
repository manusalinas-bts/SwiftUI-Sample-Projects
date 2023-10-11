//
//  CheckboxToggleStyle.swift
//
//  Created by Manuel Salinas on 8/1/23.
//

import SwiftUI

struct CheckboxLeftStyle: ToggleStyle {
    var position: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: .zero)
                .stroke(lineWidth: 2)
                .frame(width: 25, height: 25)
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .background(configuration.isOn ? .blue : .clear)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                        .foregroundStyle(.white)
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
            
            configuration.label
        }
    }
}

struct CheckboxRightStyle: ToggleStyle {
    var position: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            
            RoundedRectangle(cornerRadius: .zero)
                .stroke(lineWidth: 2)
                .frame(width: 25, height: 25)
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .background(configuration.isOn ? .blue : .clear)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                        .foregroundStyle(.white)
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}

struct CheckboxRoundedStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            
            configuration.label
            
            Spacer()
            
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
        
    }
}

// MARK: - ToggleStyle Extension 
extension ToggleStyle where Self == CheckboxLeftStyle {
    static var checkmarkLeft: CheckboxLeftStyle { CheckboxLeftStyle() }
}

extension ToggleStyle where Self == CheckboxRightStyle {
    static var checkmarkRight: CheckboxRightStyle { CheckboxRightStyle() }
}

extension ToggleStyle where Self == CheckboxRoundedStyle {
    static var checkmarkRounded: CheckboxRoundedStyle { CheckboxRoundedStyle() }
}
