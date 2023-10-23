//
//  APIProviderNetworking.swift
//  EndpointAPI
//
//  Created by Manuel Salinas on 10/17/23.
//

import Foundation

class APIProviderNetworking {
    let executor: NetworkingExecutor

    init(executor: NetworkingExecutor) {
        self.executor = executor
    }

    func getRings() async throws -> [Ring] {
        let httpRequest = try GetRings(request: RingsRequest())
        return try await executor.execute(httpRequest)
    }

    func getPokemons() async throws -> [Pokemon] {
        let httpRequest = try GetPokemons(request: nil)
        let resp =  try await executor.execute(httpRequest)

        return resp.results
    }
}
