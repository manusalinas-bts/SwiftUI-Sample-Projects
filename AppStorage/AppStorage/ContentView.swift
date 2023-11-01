//
//  ContentView.swift
//  AppStorage
//
//  Created by Manuel Salinas on 11/1/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("username") var username = "- - - -"

    var body: some View {
        NavigationStack {
            VStack {
                Text("Tap icon to change username")
                    .font(.callout)
                    .foregroundStyle(.gray)
                    .padding([.bottom], 20)


                NavigationLink {
                    ContentDetailView()
                } label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.tint)
                }

                Text(username)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.tint)

                Spacer()
            }
            .navigationTitle("App Storage")
            .toolbar(.visible, for: .navigationBar)
            .padding([.top], 50)
        }
    }
}

#Preview {
    ContentView()
}
