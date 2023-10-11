//
//  ContentView.swift
//  ShareLinkApp
//
//  Created by Manuel Salinas on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    
    private let url = URL(string: "https://twitter.com/mxnuelsg")!
    
    var body: some View {
        VStack {
            // Simple
            ShareLink(item: url)
            
            Divider()
            
            // Custom
            ShareLink(item: url) {
                Label("Compartir", systemImage: "arrow.up")
            }
            .foregroundStyle(.purple)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
