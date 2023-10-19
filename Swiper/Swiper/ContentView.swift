//
//  ContentView.swift
//  Swiper
//
//  Created by Manuel Salinas on 5/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var items = ["Rafa", "Mike", "Donatello", "Leo"]
    @State private var selectedItem: String?
    @State private var isActiveDetail = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(action: {
                                selectedItem = item
                                isActiveDetail.toggle()
                            }) {
                                Label("Detalles", systemImage: "arrow.right")
                            }
                            .tint(.blue)
                        }
                }
            }
            .navigationTitle("Tortugas")
            .navigationDestination(
                isPresented: $isActiveDetail) {
                    DetalleView(item: selectedItem ?? "")

                }

/*
 // Deprecated
            NavigationLink(
                destination: DetalleView(item: selectedItem ?? ""),
                isActive: $isActiveDetail,
                label: { EmptyView() }
            )
            */

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
