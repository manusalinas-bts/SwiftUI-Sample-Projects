//
//  ContentView.swift
//  ToogleStyle_app
//
//  Created by Manuel Salinas on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isEnabled = false
    var body: some View {
        VStack {
            Toggle("Toggle Left", isOn: $isEnabled)
                .toggleStyle(.checkmarkLeft)
            
            Toggle("Toggle right", isOn: $isEnabled)
                .toggleStyle(.checkmarkRight)
            
            Toggle("Toggle Rounded", isOn: $isEnabled)
                .toggleStyle(.checkmarkRounded)
            
            Toggle("Toggle 1", isOn: $isEnabled)
            
            Toggle(isOn: $isEnabled) {
                Text("Toggle 2")
                    .font(.system(.title, design: .rounded))
                    .bold()

            }
            
            Toggle(isOn: $isEnabled) {
                HStack {
                    Text("Toogle 3")
                    Image(systemName: "airplane")
             
                }
                .font(.system(size: 20))
            }
            .toggleStyle(SymbolToggleStyle(systemImage: "airplane", activeColor: .pink, rotateAnimation: true))
            
            Toggle(isOn: $isEnabled) {
                        Image(systemName: isEnabled ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 30))
                    }
                    .tint(.green)
                    .toggleStyle(.button)
                    .clipShape(Circle())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
