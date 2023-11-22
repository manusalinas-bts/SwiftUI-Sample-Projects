//
//  BlueNavigationModifier.swift
//  Components
//
//  Created by Manuel Salinas on 11/21/23.
//

import SwiftUI

struct NavigationStyledModifier: ViewModifier {
    var title: String?

    func body(content: Content) -> some View {
        content
            .navigationTitle(title ?? "")
            .toolbarTitleDisplayMode(.inline)
            .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}
