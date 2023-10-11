//
//  CharacterService.swift
//  RickMortyMVVM
//
//  Created by Manuel Salinas on 5/23/23.
//

import Foundation

struct CharacterService {
    enum CharacterServiceError: Error {
        case failed, failedToDecode, invalidStatusCode
    }
    
    
    func fetchCharacters() async throws -> [Character] {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw CharacterServiceError.invalidStatusCode
        }
        
        let decodedData = try JSONDecoder().decode(CharacterResult.self, from: data)
        return decodedData.results
    }
}
