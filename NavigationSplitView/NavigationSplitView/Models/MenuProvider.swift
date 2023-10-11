//
//  MenuProvider.swift
//  NavigationSplitView
//
//  Created by Manuel Salinas on 5/24/23.
//

import Foundation

struct MenuProvider {
    let mainMenuItems = {
        // Sub-menu items for Walk
        let walkMenuItems = [
            MenuItem(name: "Mac", icon: "macmini", subMenuItems: [
                MenuItem(name: "Mac Mini", icon: "macmini.fill"),
                MenuItem(name: "MAs Studio", icon: "macstudio.fill")
            ]),
            MenuItem(name: "Strada", icon: "ipod", subMenuItems: [
                MenuItem(name: "Magic Mouse", icon: "magicmouse"),
                MenuItem(name: "Mouse", icon: "computermouse"),
                MenuItem(name: "Apple Watch", icon: "applewatch"),
                MenuItem(name: "Earpods", icon: "earpods")
            ]),
            MenuItem(name: "iPod Shuffle", icon: "ipodshuffle.gen3"),
            MenuItem(name: "Cinema Display", icon: "display", subMenuItems: [
                MenuItem(name: "Pc", icon: "pc"),
                MenuItem(name: "Mac pro", icon: "macpro.gen1.fill"),
                MenuItem(name: "Laptop Classic", icon: "laptopcomputer")
            ]),
            MenuItem(name: "Flip Phone", icon: "flipphone"),
            MenuItem(name: "Radio Waves", icon: "airtag.radiowaves.forward.fill", subMenuItems: [
                MenuItem(name: "Airtag", icon: "airtag"),
                MenuItem(name: "Airtag Fill", icon: "airtag.fill")
            ])
        ]
        
        // Sub-menu items for Run
        let runMenuItems = [
            MenuItem(name: "Badminton", icon: "figure.badminton"),
            MenuItem(name: "Barre", icon: "figure.barre"),
            MenuItem(name: "Baseball", icon: "figure.baseball"),
            MenuItem(name: "Basketball", icon: "figure.basketball")
        ]
        
        // Sub-menu items for Roll
        let rollMenuItems = [
            MenuItem(name: "running", icon: "figure.roll.runningpace"),
            MenuItem(name: "Wave", icon: "figure.wave"),
            MenuItem(name: "Archer", icon: "figure.archery"),
            MenuItem(name: "Football", icon: "figure.australian.football")
        ]
        
        let topMenuItems = [
            MenuItem(name: "Walk", icon: "figure.walk", subMenuItems: walkMenuItems),
            MenuItem(name: "Run", icon: "figure.run", subMenuItems: runMenuItems),
            MenuItem(name: "Roll", icon: "figure.roll", subMenuItems: rollMenuItems)
        ]
        
        return topMenuItems
    }()
    
    func subMenuItems(for id: MenuItem.ID) -> [MenuItem]? {
        guard let menuItem = mainMenuItems.first(where: { $0.id == id }) else {
            return nil
        }
        
        return menuItem.subMenuItems
    }
    
    func menuItem(for categoryID: MenuItem.ID, itemID: MenuItem.ID) -> MenuItem? {
        
        guard let subMenuItems = subMenuItems(for: categoryID) else {
            return nil
        }
        
        guard let menuItem = subMenuItems.first(where: { $0.id == itemID }) else {
            return nil
        }
        
        return menuItem
    }
}
