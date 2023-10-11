//
//  CharactersViewModel.swift
//  RickMortyMVVM
//
//  Created by Manuel Salinas on 5/23/23.
//

import Foundation

@MainActor
class CharactersViewModel: ObservableObject {
    enum State {
        case none, loading
        case success(characters: [Character]), failed(error: Error)
    }
    
    @Published private(set) var state: State = .none
    @Published var hasError: Bool = false
    
    private let service: CharacterService
    
    init(service: CharacterService) {
        self.service = service
    }
    
    func getCharacters() async {
        state = .loading
        hasError = false
        
        do {
            let characters = try await service.fetchCharacters()
            state = .success(characters: characters)
        } catch {
            state = .failed(error: error)
            hasError = true
        }
    }
}
