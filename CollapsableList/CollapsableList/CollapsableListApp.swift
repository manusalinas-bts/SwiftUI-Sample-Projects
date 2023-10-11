//
//  CollapsableListApp.swift
//  CollapsableList
//
//  Created by Manuel Salinas on 5/16/23.
//

import SwiftUI

@main
struct CollapsableListApp: App {
    
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()// configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .systemMint.withAlphaComponent(0.8)
        coloredAppearance.backgroundEffect = UIBlurEffect(style: .light)
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
        UINavigationBar.appearance().tintColor = .white

    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
