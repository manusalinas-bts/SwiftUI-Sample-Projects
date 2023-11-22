//
//  ContentView.swift
//  Components
//
//  Created by Manuel Salinas on 11/21/23.
//

import SwiftUI

struct ContentView: View {
    private  let data  = MyComponent.mockingComponents()

    var body: some View {
        NavigationStack {
            List(data, id: \.id) { info in
                // Go to detail
                NavigationLink(destination: detailView(for: info.id)) {
                    Text(info.name)
                }
            }
            .font(.title3)
            .listStyle(.grouped)
            .navigationTitle("Navigation Stack")
            .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }

    private func detailView(for component: SUIComponents) -> AnyView {
            switch component {
            case .list:
                return AnyView(ListView(title: component.rawValue))

            case .groupBox:
                return AnyView(GroupBoxView(title: component.rawValue))

            case .contentUnavailableView:
                return AnyView(UnavailableContentView(title: component.rawValue))

            case .buttons:
                return AnyView(ButtonsView(title: component.rawValue))
            }
        }
}


#Preview {
    ContentView()
}
