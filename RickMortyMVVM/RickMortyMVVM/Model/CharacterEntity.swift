//
//  CharacterEntity.swift
//  RickMortyMVVM
//
//  Created by Manuel Salinas on 5/23/23.
//

import Foundation

struct Character: Codable {
    var id: Int
    var name: String
}

struct CharacterResult: Codable {
    let results: [Character]
}
