//
//  Tab.swift
//  ScrollableTabs
//
//  Created by Manuel Salinas on 11/10/23.
//

import Foundation

enum Tab: String, CaseIterable {
    case chats = "Chats"
    case calls = "Calls"
    case settings = "Settings"

    var systemImage: String {
        switch self {
        case .calls:
            return "phone"

        case .chats:
            return "bubble.left.and.bubble.right"

        case .settings:
            return "gear"
        }
    }
}
