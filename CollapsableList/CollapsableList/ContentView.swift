//
//  ContentView.swift
//  CollapsableList
//
//  Created by Manuel Salinas on 5/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isSectionExpanded = false
    
    var body: some View {
        
        NavigationView {
            List {
                // Section #1
                Section {
                    ForEach(1...5, id: \.self) {
                        Text("Human \($0)")
                    }
                } header: {
                    Text("HUMAN ROBOTS")
                        .foregroundColor(.white)
                        .font(.title2)
                } footer: {
                    Text("Estos robots seran probados el dia de mañana")
                        .foregroundColor(.white)
                }
                
                // Section #2
                DisclosureGroup("ANINMAL ROBOTS", isExpanded: $isSectionExpanded) {
                    ForEach(1...4, id: \.self) {
                        Text("Animal \($0)")
                    }
                }
                .tint(.green)
                .background(.clear)
                
                // Section #3
                Section {
                    ForEach(1...3, id: \.self) {
                        Text("Object \($0)")
                    }
                } header: {
                    Text("OBJECT ROBOTS")
                        .foregroundColor(.white)
                        .font(.title2)
                }

            }
            .listStyle(.sidebar)
            .tint(Color.yellow)
            .navigationTitle("Dexter Lab")
            .scrollContentBackground(.hidden)
            .background(
                //Gradient(colors: [.yellow, .indigo, .pink])
                Image("dexter")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
