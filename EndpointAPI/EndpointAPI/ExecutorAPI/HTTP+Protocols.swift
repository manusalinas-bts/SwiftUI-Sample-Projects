//
//  Protocols.swift
//  EndpointAPI
//
//  Created by Manuel Salinas on 10/17/23.
//

import Foundation

protocol HTTPRequest {
    associatedtype Request = Codable
    associatedtype Response = Codable

    var path: String {get}
    var method: String {get}
    var headers: [String:String] {get}
    var bodyData: Data? {get}
    var timeoutInterval: Int { get }

    init(request: Request, headers: [String:String]) throws

}

// Usamos este modelo para la descarga de archivos
protocol HTTPDownloadRequest: HTTPRequest {
    associatedtype Response = URL
    associatedtype Request = Codable
}
