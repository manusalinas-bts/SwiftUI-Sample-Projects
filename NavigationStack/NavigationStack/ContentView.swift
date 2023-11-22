//
//  ContentView.swift
//  NavigationStack
//
//  Created by Manuel Salinas on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            // * * Config # 1
           // /*
            ZStack {
                Color.green.opacity(0.25)
                    .ignoresSafeArea()

                Color.gray.opacity(0.25)
                    .ignoresSafeArea(edges: .bottom)

            }
          //  */

            // * * Config # 2
//            ZStack {
//                LinearGradient(colors: [.pink, .purple],
//                               startPoint: .leading,
//                               endPoint: .trailing)
//                .ignoresSafeArea()
//
//                Color.white.opacity(0.9)
//                    .ignoresSafeArea(edges: .bottom)
//
//            }
            .navigationTitle("Navigation Stack")
        }
    }
}

#Preview {
    ContentView()
}
