//
//  Constants.swift
//  EndpointAPI
//
//  Created by Manuel Salinas on 10/17/23.
//

import Foundation

struct Constants {
    static let requestTimeoutInterval: Int = 60
    static var uri: String = "https://pokeapi.co/api/v2"
    static var pokemonPictureUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/{pokemonId}.png"
}

struct UserDefaultsKeys {
    static let uri = "kUri"
}
