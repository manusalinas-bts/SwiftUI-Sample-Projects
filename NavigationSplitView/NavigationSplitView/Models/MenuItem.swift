//
//  MenuItem.swift
//  NavigationSplitView
//
//  Created by Manuel Salinas on 5/24/23.
//

import Foundation

struct MenuItem: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var icon: String
    var subMenuItems: [MenuItem]?
}
