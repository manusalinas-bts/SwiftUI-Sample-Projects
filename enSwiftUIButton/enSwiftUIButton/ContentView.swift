//
//  ContentView.swift
//  enSwiftUIButton
//
//  Created by Manuel Salinas on 8/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotated = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {

                Button {
                    // What to perform
                    print("Tocaste el boton")
                } label: {
                    // How the button looks like
                    Text("Boton 1")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .font(.title)
                    
                }
                
                Button {
                    // What to perform
                    print("Tocaste el boton")
                } label: {
                    // How the button looks like
                    Text("Boton 2")
                        .padding()
                        .foregroundColor(.blue)
                        .font(.title)
                        .border(.blue, width: 5)
                    
                }
                
                Button {
                    // What to perform
                    print("Tocaste el boton")
                } label: {
                    // How the button looks like
                    Text("Boton 3")
                        .fontWeight(.semibold)
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(10)
                        .border(.blue, width: 5)
                    
                }
                
                Button {
                    // What to perform
                    print("Tocaste el boton")
                } label: {
                    // How the button looks like
                    Text("Boton 4")
                        .fontWeight(.semibold)
                        .padding()
                        .background(.blue)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(.blue, lineWidth: 5)
                        )
                }
                
                Button {
                    // What to perform
                    print("Tocaste el boton")
                } label: {
                    // How the button looks like
                    Image(systemName: "trash.fill")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    
                }
                
                Button {
                    // What to perform
                    print("Tocaste el boton")
                } label: {
                    // How the button looks like
                    Image(systemName: "trash.fill")
                        .padding()
                        .font(.largeTitle)
                        .background(.red)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    
                }
                
                Button {
                    // What to perform
                    print("Tocaste el boton")
                } label: {
                    // How the button looks like
                    HStack {
                        Image(systemName: "trash")
                            .font(.title)
                        
                        Text("Eliminar")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .frame(width: 180)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(40)
                }
                
                Button {
                    // What to perform
                    print("Tocaste el boton")
                } label: {
                    // How the button looks like
                    VStack {
                        Group {
                            Image(systemName: "gamecontroller.fill")
                            Text("Jugar")
                        }
                        .foregroundColor(.white)
                        .font(.title)
                    }
                    .padding()
                    .background(.indigo)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                Button{
                    print("Delete tapped!")
                } label: {
                    Label {
                        Text("Eliminar")
                            .fontWeight(.semibold)
                            .font(.title)
                    } icon: {
                        Image(systemName: "trash.fill")
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(40)
                }
                
                Button {
                    rotated.toggle()
                } label: {
                    Label {
                        Text("Comprar")
                            .fontWeight(.semibold)
                            .font(.title)
                    } icon: {
                        Image(systemName: "cart.fill")
                            .font(.title)
                    }
                    .frame(width: 160)
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        LinearGradient(colors: [.green, .blue, .orange, .yellow],
                                       startPoint: .leading,
                                       endPoint: .trailing)
                    )
                    .cornerRadius(40)
                }
                .rotationEffect(.degrees(rotated ? -20 : 0))
            }
            .padding()
            
            Button {
                // prominente
            } label: {
                Text("Buy me a coffee")
            }
            .tint(.blue)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 5))
            .controlSize(.large)
            
            Button {
                // cpsula
            } label: {
                Text("Buy me a coffee")
                .font(.body)            }
            .tint(.blue)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.regular)
            
            // iOS 15 - UIKit Style
            VStack {
                Button(action: {}) {
                    Text("Add to Cart")
                        .font(.headline)
                }

                Button(action: {}) {
                    Text("Discover")
                        .font(.headline)
                        .frame(maxWidth: 300)
                }

                Button(action: {}) {
                    Text("Check out")
                        .font(.headline)
                }
            }
            .tint(.purple)
            .buttonStyle(.bordered)
            .controlSize(.large)
            
        }
        .padding()
        .scaledToFit()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
