//
//  ContentView.swift
//  Custom-Navigation-Toolbar
//
//  Created by Manuel Salinas on 10/27/23.
//

import SwiftUI

struct ContentView: View {

    @State private var showNavBar = true
    @State private var showBottomBar = true

    var body: some View {
        NavigationStack {
            List(1..<10, id: \.self) { index in
                NavigationLink("Item \(index)") {
                    Text("Detail\n\(index)")
                        .font(.system(size: 100))
                        .multilineTextAlignment(.center)
                        .toolbarBackground(.visible, for: .navigationBar)
                        .toolbarColorScheme(.dark, for: .navigationBar)
                        .padding()
                }
            }

            .navigationTitle("Toolbar Demo")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Button{
                        showBottomBar.toggle()
                    } label: {
                        Image(systemName: "person.crop.circle")
                    }
                    .foregroundStyle(.black)
                }

                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        // action
                        print("menu")
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // action
                        print("plus")
                    } label: {
                        Image(systemName: "plus")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // action
                        print("share")
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }

                ToolbarItem(placement: .bottomBar) {
                    Image(systemName: "folder")
                }

                ToolbarItem(placement: .bottomBar) {
                    Image(systemName: "message")
                }

                ToolbarItem(placement: .status) {
                    Button {
                        print("Hide Show Nav")
                        showNavBar.toggle()
                    } label: {
                        Text(showNavBar ? "Hide Navigation" : "Show Navigation")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.extraLarge)
                }

            }
            .toolbar(showNavBar ? .visible : .hidden, for: .navigationBar)
            .animation(.easeInOut, value: showNavBar)
            .toolbar(showBottomBar ? .visible : .hidden, for: .bottomBar)
            .animation(.easeInOut, value: showBottomBar)
        }
    }
}

#Preview {
    ContentView()
}
