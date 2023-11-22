//
//  UnavailableContentView.swift
//  Components
//
//  Created by Manuel Salinas on 11/21/23.
//

import SwiftUI

struct UnavailableContentView: View {
    var title: String?

    var body: some View {
        ContentUnavailableView {
            // 1
            Label("Empty Bookmarks", systemImage: "wifi")
                .symbolEffect(.variableColor)

        } description: {
            // "
            Text("Explore a great movie and bookmark the one you love to enjoy later.")
        } actions: {
            // 3
            Button {
                //...
                print("Action goes here!")
            } label: {
                Label("Retry", systemImage: "arrow.circlepath")
            }
            .buttonStyle(.bordered)
            .foregroundStyle(.indigo)
        }
        .modifier(NavigationStyledModifier())
        .padding()
    }
}

#Preview {
    UnavailableContentView()
}
