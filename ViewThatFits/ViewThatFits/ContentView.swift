//
//  ContentView.swift
//  ViewThatFits
//
//  Created by Manuel Salinas on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ViewThatFits(in: .horizontal) {

            RoundedRectangle(cornerRadius: 16)                .fill(Color.pink.opacity(0.7))
                .overlay(Text("For Landscape"))
                .frame(width: 700, height: 75)

            RoundedRectangle(cornerRadius: 16)                .fill(Color.indigo.opacity(0.7))                .overlay(Text("For Portrait"))
                .frame(width: 350, height: 75)

            Text("No views fit")
                .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
