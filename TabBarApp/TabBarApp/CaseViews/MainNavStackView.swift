//
//  MainNavStackView.swift
//  TabBarApp
//
//  Created by Manuel Salinas on 8/15/23.
//

import SwiftUI

struct MainNavStackView: View {
    @Binding var selection: Int
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selection) {
                Group {
                    NavigationLink("Home Detail", destination: EmptyViewIcon(systemIconName: "house.fill"))
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .tag(0)
                    
                    NavigationLink("Bookmarks Detail", destination: EmptyViewIcon(systemIconName: "book"))
                        .tabItem {
                            Image(systemName: "book")
                            Text("Bookmarks")
                        }
                        .tag(1)
                    
                    NavigationLink("Profile Detail", destination: EmptyViewIcon(systemIconName: "person"))
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                        .tag(2)
                    
                    NavigationLink("Settings Detail", destination: EmptyViewIcon(systemIconName: "gear"))
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                        .tag(3)
                }
                .toolbarBackground(.green.opacity(0.5), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .tint(.green)
            }
            .navigationTitle("Title for item \(selection)")
            .toolbarBackground(.green.opacity(0.5), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .tint(.white.opacity(0.6))
        }
    }
}

#Preview {
    MainNavStackView(selection: .constant(0))
}
