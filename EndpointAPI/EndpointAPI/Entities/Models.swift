//
//  Models.swift
//  EndpointAPI
//
//  Created by Manuel Salinas on 10/17/23.
//

import Foundation


// MARK: - Executor request
class GetPokemons: HTTPRequest {
    typealias Request = PokemonRequest?
    typealias Response = PokemonResult

    var path: String = "/pokemon"
    var method: String = "GET"
    var headers: [String : String]
    var bodyData: Data?
    var timeoutInterval: Int = Constants.requestTimeoutInterval

    required init(request: PokemonRequest?, headers: [String : String] = [:]) throws {
        self.headers = headers
        self.bodyData =  nil
    }
}

class PokemonRequest: Codable {
}



// MARK: - SAMPLE
class GetRings: HTTPRequest {
    typealias Request = RingsRequest
    typealias Response = [Ring]

    var path: String = "api/rings"
    var method: String = "GET"
    var headers: [String : String]
    var bodyData: Data?
    var timeoutInterval: Int = Constants.requestTimeoutInterval

    required init(request: RingsRequest, headers: [String : String] = [:]) throws {
        self.headers = headers
        self.bodyData = nil
    }
}

class RingsRequest: Codable {
}

class Ring: Codable {

    let isDeleted: Bool
    let ringId: String
    let name: String
    let referenceNumber: String
    let description: String
    let category: String
    let catalogUrl: String
    let ringImage: String
    let ringImageHd: String
    let overlayImageUrl: String
    let coverImageUrl: String
    let fileAssetUrl: String
    let updated: Int
    let id: Int

    init(isDeleted: Bool,
         ringId: String,
         name: String,
         referenceNumber: String,
         description: String,
         category: String,
         catalogUrl: String,
         ringImage: String,
         ringImageHd: String,
         overlayImageUrl: String,
         coverImageUrl: String,
         fileAssetUrl: String,
         updated: Int,
         id: Int
    ) {
        self.isDeleted = isDeleted
        self.ringId = ringId
        self.name = name
        self.referenceNumber = referenceNumber
        self.description = description
        self.category = category
        self.catalogUrl = catalogUrl
        self.ringImage = ringImage
        self.ringImageHd = ringImageHd
        self.overlayImageUrl = overlayImageUrl
        self.coverImageUrl = coverImageUrl
        self.fileAssetUrl = fileAssetUrl
        self.updated = updated
        self.id = id
    }
}


class GenerateTakeawayImages: HTTPRequest {

  typealias Response = GenerateTakeawayImagesResponse
  typealias Request = GenerateTakeawayImagesRequest

  let path: String = "api/generate-takeaway-images"
  let method: String = "POST"
  let headers: [String : String]
  let bodyData: Data?
  var timeoutInterval: Int = Constants.requestTimeoutInterval

  required init(request: GenerateTakeawayImagesRequest, headers: [String : String] = [:]) throws {
    var defaultHeader = headers
    defaultHeader["Content-Type"] = "application/json"
    self.headers = defaultHeader
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    self.bodyData = try encoder.encode(request)
  }

}

// Request
class GenerateTakeawayImagesRequest: Codable {

  let ringId: String
  let videoUuid: String

  init(ringId: String, videoUuid: String) {
    self.ringId = ringId
    self.videoUuid = videoUuid
  }
}

// Response
class GenerateTakeawayImagesResponse: Codable, Identifiable {

  let sent: Bool
  let takeawayPaths: [String]

  init(sent: Bool, takeawayPaths: [String]) {
    self.sent = sent
    self.takeawayPaths = takeawayPaths
  }
}
