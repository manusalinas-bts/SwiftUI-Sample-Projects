//
//  ContentView.swift
//  PhotosPicker_app
//
//  Created by Manuel Salinas on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    private var items = ["Select Photo", "Select Photos"]
    var body: some View {
        NavigationStack {
            List {
                ForEach(items.indices, id: \.self) { index in
                    if index == 0 {
                        NavigationLink(
                            items[index],
                            destination: SinglePhotosPicker()
                        )
                    } else {
                        NavigationLink(
                            items[index],
                            destination: MultiplePhotosPicker()
                        )
                    }
                }
            }
            .navigationTitle("Photos Picker")
        }
    }
}

#Preview {
    ContentView()
}
