//
//  ContentView.swift
//  ButtonStyles
//
//  Created by Manuel Salinas on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Classic Style
            Button("The Classic", action: {
                print("Classic tap")
            })

            // Solid Style
            Button("The Solid") {
                print("Solid tap")
            }
            .buttonStyle(.borderedProminent)

            // Outline Style
            Button {
                print("Outline tap")
            } label: {
                Text("The Outline")
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.blue, lineWidth: 1)
                    }
            }

            // Image & Text Style
            Button {
                print("Image & Text tap")
            } label: {
                Label("The Image & Text", systemImage: "hand.thumbsup.fill")
            }

            // Transluced background Style
            Button("The Translucent Background") {
                print("Translucent tap")
            }
            .buttonStyle(.bordered)

            // Gradient Style
            let gradient = LinearGradient(colors: [.pink, .purple],
                                          startPoint: .topLeading,
                                          endPoint: .bottomTrailing)

            Button {
                print("Gradient tap")
            } label: {
                Text("The Gradient")
                    .padding()
                    .background {
                        Capsule()
                            .stroke(gradient, lineWidth: 2)
                            .saturation(1.8)
                    }
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
