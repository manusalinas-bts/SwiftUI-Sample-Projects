//
//  ContentView.swift
//  TabBarApp
//
//  Created by Manuel Salinas on 7/25/23.
//

import SwiftUI

enum ViewType {
    case floatingNextButton, navStack
}

struct ContentView: View {
    @State private var selection = 0
    private let screenType: ViewType = .navStack
    
    var body: some View {
        
        switch screenType {
        case .floatingNextButton:
            FloatingNextButtonView(selection: $selection)
            
        case .navStack:
            MainNavStackView(selection: $selection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
