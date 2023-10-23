//
//  ContentView.swift
//  GroupBox
//
//  Created by Manuel Salinas on 10/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GroupBox {
                Image(systemName: "wifi")
                    .resizable()
                    .frame(width: 60, height: 50)
                    .symbolEffect(.variableColor)

                Text("Signal Intesity")
                    .font(.title3)

                Button(action: {
                    print("Testing Internet..")
                }, label: {
                    Text("Test")
                })
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
