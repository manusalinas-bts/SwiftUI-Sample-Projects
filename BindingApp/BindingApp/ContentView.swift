//
//  ContentView.swift
//  BindingApp
//
//  Created by Manuel Salinas on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    @State private var contador: Int = 0
    
    var body: some View {
        NavigationStack {
            List {
                ForEach((1...5), id: \.self) { num in
                    NavigationLink(destination: DetailCounter(counter: $contador)) {
                        Text("Row \(num)")
                            .font(.title2)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Contador")
            .toolbarBackground(Color.yellow, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                HStack {
                    Text("\(contador)")
                        .font(.largeTitle)
                    
                    Button {
                        contador = 0
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                    }
                }
                .background(.brown)
                .foregroundColor(.yellow)
                .padding()
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
