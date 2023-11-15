//
//  PokemonListRow.swift
//  EndpointAPI
//
//  Created by Manuel Salinas on 10/23/23.
//

import SwiftUI

struct PokemonListRow: View {
    var pokemon: Pokemon
    @State private var imageUrl: String?

        var body: some View {
        HStack {
            if let imageUrl {
                AsyncImage(url: URL(string: imageUrl)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)

                } placeholder: {
                    Color.gray
                }
                .frame(width: 80, height: 80)
                .cornerRadius(5)
            }

            Text(pokemon.name)
                .font(.largeTitle)
            Spacer()
        }
        .onAppear {
            Task {
                if imageUrl == nil {
                    if let id = URL(string: pokemon.url)!.lastPathComponent.components(separatedBy: "/").last {
                        self.imageUrl = Path().pokePic.replacingOccurrences(of: "{pokemonId}", with: id)
                        print(pokemon.name + " has been loaded!")
                    }
                }
            }
        }
    }
}
