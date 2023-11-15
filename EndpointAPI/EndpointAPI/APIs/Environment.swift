//
//  Environment.swift
//  Created by Manuel Salinas on 11/13/23.
//

import Foundation

// MARK: - Environment
enum Environment {
    case development
    case staging
    case production

    var baseURL: String {
        "\(urlProtocol)://\(subdomain).\(domain)\(route)"
    }

    var urlProtocol: String {
        switch self {
        default:
            return "https"
        }
    }

    var domain: String {
        switch self {
        case .development, .staging, .production:
            return "co"
        }
    }

    var subdomain: String {
        switch self {
        case .development, .staging, .production:
            return "pokeapi"
        }
    }

    var route: String {
        "/api/v2"
    }

}

extension Environment {
    var host: String {
        "\(self.subdomain).\(self.domain)"
    }
}


// MARK: - Base URL
#if DEBUG
let environment: Environment = Environment.development
#else
let environment: Environment = Environment.staging
#endif

let baseUrl = environment.baseURL
