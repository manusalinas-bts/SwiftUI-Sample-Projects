//
//  GenericApi.swift
//

import Foundation

protocol GenericApi {
    var session: URLSession { get }
    func fetch<T: Codable>(request: URLRequest) async throws -> T
}
