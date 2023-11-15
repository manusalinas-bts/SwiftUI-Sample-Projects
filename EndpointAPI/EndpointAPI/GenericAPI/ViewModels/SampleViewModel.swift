//
//  SampleViewModel.swift
//

import Foundation

@Observable
final class PokemonViewModel: ObservableObject {
    private let client = ApiClient()
    
    var items: [Pokemon] = []
    var isProgress: Bool = false
    
    // MARK: Remote Info
    private func getPokemons() async {
        guard let urlData = URL(string: Path.Pokemon().list) else {
            return
        }
        
        let urlRequest = URLRequest(url: urlData)
        
        do {
            let resp: PokemonResult = try await client.fetch(request: urlRequest)
            items = resp.results
        } catch {
            print("\((error as! ApiError).customDescription)")
        }
    }

    // MARK: Get Sprites
    func getSprites(_ pokemon: Pokemon) async -> Sprites?{
        guard let urlData = URL(string: pokemon.url) else {
            return nil
        }

        let urlRequest = URLRequest(url: urlData)

        do {
            let resp: PokemonCharacter = try await client.fetch(request: urlRequest)
            return resp.sprites

        } catch {
            print("\((error as! ApiError).customDescription)")
            return nil
        }
    }

    // MARK: Helpers
    func fetchPokemons() async {
        items.removeAll()
        isProgress = true
        Task {
            await getPokemons()
            isProgress = false
        }
    }
}
