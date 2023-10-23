//
//  ContentView.swift
//  DisclosureGroup
//
//  Created by Manuel Salinas on 10/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        DisclosureGroup {

            DisclosureGroup("Swift") {
                VStack(alignment: .leading) {
                    Text("- Variables")
                    Text("- Constants")
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .tint(.orange)

            DisclosureGroup("Swift UI") {
                VStack(alignment: .leading) {
                    Text("- Text")
                    Text("- Spacer")
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .tint(.blue)
        } label: {
            Text("iOS Development")
                .font(.largeTitle)
        }
        .tint(.black)
        .padding()
    }
}

#Preview {
    ContentView()
}
