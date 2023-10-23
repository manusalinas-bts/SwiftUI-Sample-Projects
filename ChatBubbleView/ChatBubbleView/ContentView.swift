//
//  ContentView.swift
//  ChatBubbleView
//
//  Created by Manuel Salinas on 10/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ChatBubbleView(title: "Hello, W R U?", style: .receiver, status: .read)
            ChatBubbleView(title: "Fine thx")
            ChatBubbleView(title: "are you okay?", status: .none)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
