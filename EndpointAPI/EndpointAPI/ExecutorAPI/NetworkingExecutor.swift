import Foundation

class NetworkingExecutor {

    let debugPrint: Bool
    let userDefaults: UserDefaults
    var baseURL: URL {
        if userDefaults.dictionaryRepresentation()[UserDefaultsKeys.uri] == nil {
            userDefaults.set(Constants.uri, forKey: UserDefaultsKeys.uri)
        }
        let urlAsString = userDefaults.string(forKey: UserDefaultsKeys.uri) ?? Constants.uri
        let url = URL(string: urlAsString)

        return url ?? URL(string: Constants.uri)!
    }

    init(userDefaults: UserDefaults, debugPrint: Bool = false) {
        self.userDefaults = userDefaults
        self.debugPrint = debugPrint
    }

    // Execute a request
    func execute<T:HTTPRequest>(_ httpRequest: T) async throws -> T.Response where T.Request:Codable, T.Response:Decodable {

        let urlSession = URLSession.shared
        let path = httpRequest.path
        let requestURL = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: requestURL)

        request.allHTTPHeaderFields = httpRequest.headers
        request.httpBody = httpRequest.bodyData
        request.httpMethod = httpRequest.method
        request.timeoutInterval = TimeInterval(httpRequest.timeoutInterval)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

#if DEBUG
        if debugPrint {
            printHTTPRequest(request: httpRequest)
        }
#endif

        let (data, httpResponse) = try await urlSession.data(for: request, delegate: nil)

        do {
            let decodedResponse = try decoder.decode(T.Response.self, from: data)

#if DEBUG
            if debugPrint {
                print("----- Success Response Request (Url) | \(requestURL) -----")
                print("----- Success Response Data (JSON):\n \(data.prettyJSON)\n-----")
            }
#endif

            return decodedResponse

        } catch {

#if DEBUG
            print("Response JSON decoding error: \(error)\n")
#endif

            guard let httpUrlResponse = httpResponse as? HTTPURLResponse else {
                throw error
            }

            /*
             In some requests, it's not possible to decode the response because the server returns a text instead of a JSON.
             The response of the server is an "ok" with content-type text, so this
             block of code validates the response status instead of the text response.
             */
            if (200..<300).contains(httpUrlResponse.statusCode) {

                let emptyJson = "{}"
                let data: Data = emptyJson.data(using: .utf8)!
#if DEBUG
                if debugPrint {
                    print("----- Success Response (Text) | \(requestURL) -----")
                }
#endif
                return try decoder.decode(T.Response.self, from: data)

            }
            else {
                let error = errorForHTTPStatusCode(httpUrlResponse.statusCode)

#if DEBUG
                if debugPrint {
                    print("----- Error Response | \(requestURL) | \(error.localizedDescription) -----")
                    print("----- Error Response Data (JSON):\n \(data.prettyJSON)\n-----")
                }
#endif
                throw error
            }
        }
    }

    // Download a resource from a url
    func execute<T:HTTPDownloadRequest>(_ httpRequest: T)
    async throws -> URL
    where T.Request:Codable {

        let urlSession = URLSession.shared
        let path = httpRequest.path
        let requestURL = baseURL.appendingPathComponent(path)

        var request = URLRequest(url: requestURL)
        request.allHTTPHeaderFields = httpRequest.headers
        request.httpBody = httpRequest.bodyData
        request.httpMethod = httpRequest.method

#if DEBUG
        if debugPrint {
            printHTTPRequest(request: httpRequest)
            print("----- Download | \(requestURL) -----")
        }
#endif

        /*
         This block of code allows to verify if the download of the video is correct. Prints the "expected content length" and shows the download per byte
         */

        //    let (bytes, urlResponse)  = try await urlSession.bytes(for: request, delegate: nil)
        //    let capacity = urlResponse.expectedContentLength
        //    print(capacity)
        //    for try await byte in bytes {
        //      print(byte)
        //    }

        let (url, _) = try await urlSession.download(for: request, delegate: nil)
        return url
    }

    private func errorForHTTPStatusCode(_ code: Int) -> NetworkingExecutorError {
        switch code {
        case 400:
            return NetworkingExecutorError.badRequest
        case 404:
            return NetworkingExecutorError.notFound
        case 500:
            return NetworkingExecutorError.internalServer
        default:
            return NetworkingExecutorError.unknownError(code: code)
        }
    }

    private func printHTTPRequest<T:HTTPRequest>(request: T) where T.Request:Encodable {
        print("\n----------- HTTP Request --------------")
        print("HTTP Request Path: \(request.path)")
        print("HTTP Request URL: \(baseURL.appendingPathComponent(request.path))")
        print("HTTP Request Method: \(request.method)")
        print("HTTP Request Headers: \(request.headers)")
        if let bodyData = request.bodyData {
            print("HTTP Request Body: \(bodyData.prettyJSON)")
        }
        else {
            print("HTTP Request Body: (Empty)")
        }
        print("---------------------------------------\n")
    }

}

enum NetworkingExecutorError: Error {
    case badRequest
    case notFound
    case internalServer
    case unknownError(code: Int)
}

extension NetworkingExecutorError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return NSLocalizedString(
                "Bad request. (400)",
                comment: ""
            )
        case .notFound:
            return NSLocalizedString(
                "Content not found. (404)",
                comment: ""
            )
        case .internalServer:
            return NSLocalizedString(
                "Internal server error. (500)",
                comment: ""
            )
        case .unknownError(code: let code):
            return NSLocalizedString("Networking error. (\(code))", comment: "")
        }
    }
}

extension Data {
    var prettyJSON: String {
        if let json = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
            return String(decoding: jsonData, as: UTF8.self)
        } else {
            return "Debug JSON decoding error"
        }
    }
}
