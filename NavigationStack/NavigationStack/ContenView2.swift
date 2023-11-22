//
//  ContenView2.swift
//  NavigationStack
//
//  Created by Manuel Salinas on 11/21/23.
//

import SwiftUI

struct ContenView2: View {
    let array = ["Placeholder 1", "Placeholder 2"]

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(array, id: \.self) { datum in
                        Text(datum)
                    }
                } header: {
                    Text("Header ").bold().font(.title)
                } footer: {
                    Text("Footer").font(.footnote)
                }
            }
            .navigationTitle("Navigation Stack")
            .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    ContenView2()
}
