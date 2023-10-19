//
//  EmptySearchView.swift
//  SwiftUI-ToDoApp
//
//  Created by Manuel Salinas on 10/17/23.
//

import SwiftUI

struct EmptySearchView: View {
    var body: some View {
        ContentUnavailableView {
            Label("No Results", systemImage: "magnifyingglass")
                .symbolEffect(.pulse)

        } description: {
            Text("Try other term")
        }
        .padding()
    }
}

#Preview {
    EmptySearchView()
}
