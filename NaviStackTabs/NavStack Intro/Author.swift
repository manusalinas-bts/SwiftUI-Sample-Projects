//
//  Author.swift
//  NavStackIntro
//
//  Created by Manuel Salinas on 11/16/23.
//

import SwiftUI

struct Author: Identifiable, Hashable {
    let name: String
    let numBooks: Int
    let color: Color
    var id: String {
        name
    }

    static var sample: [Author] {
        [
            .init(name: "Mark Twain", numBooks: 28, color: .orange),
            .init(name: "Robert Ludlum", numBooks: 27, color: .red),
            .init(name: "Robert Harris", numBooks: 18, color: .purple),
            .init(name: "Jane Austen", numBooks: 7, color: .cyan),
            .init(name: "Agatha Christie", numBooks: 66, color: .blue)
        ]
    }
}
