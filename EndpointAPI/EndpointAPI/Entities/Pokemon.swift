//
//  Pokemon.swift
//  EndpointAPI
//
//  Created by Manuel Salinas on 10/23/23.
//

import Foundation

// MARK: - POKEMON
struct PokemonResult: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
    let url: String

    var sprites: Sprites?
}

// MARK: - PokemonCharacter
struct PokemonCharacter: Codable {
    let id: Int
    let sprites: Sprites
}

// MARK: - Sprites
class Sprites: Codable {
    var back_default: String?
    var back_shiny: String?
    var front_default: String?
    var front_shiny: String?

}


