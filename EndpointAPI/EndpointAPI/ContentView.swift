//
//  ContentView.swift
//  EndpointAPI
//
//  Created by Manuel Salinas on 10/17/23.
//

import SwiftUI

struct ContentView: View {
    private let webApi  = APIProviderNetworking(executor: NetworkingExecutor(userDefaults: UserDefaults(), debugPrint: true))
    @State private var viewModel = PokemonViewModel()

    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "dog.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Ash!")

            Button {
                Task {
                    // * * * Via Executor API
                   // let pokemones = try await webApi.getPokemons()
                    //print("Number of Pokemons: ", pokemones.count)

                    // * * * Via Generic API
                    await viewModel.fetchPokemons()
                }
            } label: {
                Text("Obtener API")
            }

            Divider()

            List(viewModel.items, id: \.name) { pokemon in
                PokemonListRow(pokemon: pokemon)
            }
            .listStyle(.inset)
            .padding([.horizontal], 8)
        }
    }
}

#Preview {
    ContentView()
}
