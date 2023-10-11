//
//  ContentView.swift
//  EmptyState_app
//
//  Created by Manuel Salinas on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isEmpty = true
    var body: some View {
        VStack {
            if isEmpty {
                ContentUnavailableView {
                    // 1
                    Label("Empty Bookmarks", systemImage: "wifi")
                        .symbolEffect(.variableColor)
                    
                } description: {
                    Text("Explore a great movie and bookmark the one you love to enjoy later.")
                } actions: {
                    // 2
                    Button {
                        isEmpty.toggle()
                    } label: {
                        Label("Retry", systemImage: "arrow.circlepath")
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.indigo)
                }
                .padding()
                
            } else {
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200, alignment: .center)
                    .foregroundStyle(.green)
                    .symbolRenderingMode(.multicolor)
                    .symbolEffect(.variableColor)
                
                Text("Connection Success")
                    .font(.largeTitle)
                
                Button {
                    isEmpty.toggle()
                } label: {
                    Label("Turn Off", systemImage: "bolt.slash.fill")
                }
                .buttonStyle(.bordered)
                .tint(.red)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
