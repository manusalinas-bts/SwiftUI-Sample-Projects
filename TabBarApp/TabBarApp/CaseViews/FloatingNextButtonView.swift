//
//  FloatingNextButton.swift
//  TabBarApp
//
//  Created by Manuel Salinas on 8/15/23.
//

import SwiftUI

struct FloatingNextButtonView: View {
    @Binding var selection: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            TabView(selection: $selection) {
                NavigationStack {
                    NavigationLink("Navegar", destination: EmptyViewIcon(systemIconName: "house.fill"))
                        .navigationTitle("Home")
                        .toolbarBackground(.cyan.opacity(0.5), for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
                
                NavigationStack {
                    NavigationLink("Go!", destination: EmptyViewIcon(systemIconName: "book"))
                        .navigationTitle("Home")
                        .toolbarBackground(.cyan.opacity(0.5), for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                }
                .tabItem {
                    Image(systemName: "book")
                    Text("Bookmarks")
                }
                .tag(1)
                
                Color.indigo
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(2)
                
                Color.cyan
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .tag(3)
            }
            .tint(.cyan)
            
            ProgramaticNextButton(selectedIndex: $selection)
        }
    }
}

#Preview {
    FloatingNextButtonView(selection: .constant(0))
}
