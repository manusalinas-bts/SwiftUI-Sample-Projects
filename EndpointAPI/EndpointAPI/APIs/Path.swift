//
//  Path.swift
//
//  Created by Manuel Salinas on 11/13/23.
//

import Foundation

struct Path {
    var pokePic: String { return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/{pokemonId}.png" }

    struct Pokemon {
        var list: String { return "\(baseUrl)/pokemon" }
    }
}

