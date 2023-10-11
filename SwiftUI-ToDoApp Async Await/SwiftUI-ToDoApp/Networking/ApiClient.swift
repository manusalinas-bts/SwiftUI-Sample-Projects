//
//  ApiClient.swift
//

import Foundation

final class ApiClient {
    let session: URLSession
    
    // MARK: Initialization
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
}

// MARK: - Conforming 'GenericApi' protocol
extension ApiClient: GenericApi {
    func fetch<T>(request: URLRequest) async throws -> T where T : Decodable, T : Encodable {
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.requestFailed(description: "Invalid response")
        }
        
        guard httpResponse.statusCode == 200 else {
            throw ApiError.responseUnsuccessful(description: "Status code: \(httpResponse.statusCode)")
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw ApiError.jsonConversionFailure(description: error.localizedDescription)
        }
    }
}
