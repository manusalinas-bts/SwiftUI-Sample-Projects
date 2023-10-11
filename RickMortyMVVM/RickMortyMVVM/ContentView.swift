//
//  ContentView.swift
//  RickMortyMVVM
//
//  Created by Manuel Salinas on 5/23/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CharactersViewModel(
        service: CharacterService()
    )
    
    
    var body: some View {
        NavigationStack {
            switch viewModel.state {
            case .success(let chars):
                List {
                    ForEach(chars, id: \.id) { item in
                        Text(item.name)
                    }
                }
                .navigationTitle("Characters")
                
            case .loading:
                ProgressView()
                
            default:
                EmptyView()
            }
        }
        .task {
            await viewModel.getCharacters()
        }
        .alert("Error",
               isPresented: $viewModel.hasError,
               presenting: viewModel.state) { detail in
            Button("Cancel") {
                
            }
            
            Button("Retry") {
                Task {
                    await viewModel.getCharacters()
                }
            }
            
        } message: { detail in
            if case let .failed(error) = detail {
                Text(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
