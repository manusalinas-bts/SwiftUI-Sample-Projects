//
//  ListView.swift
//  Components
//
//  Created by Manuel Salinas on 11/21/23.
//

import SwiftUI

struct ListView: View {
    var title: String?
    let array = ["Placeholder 1", "Placeholder 2"]

    var body: some View {
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
        .modifier(NavigationStyledModifier(title: title))
    }
}

#Preview {
    ListView(title: "Hola")
}
