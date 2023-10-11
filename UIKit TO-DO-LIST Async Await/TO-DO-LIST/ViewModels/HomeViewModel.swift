//
//  HomeViewModel.swift
//  TO-DO-LIST
//
//  Created by Manuel Salinas on 7/11/23.
//

import UIKit

class HomeViewModel {
    /// Closure option
    @available(*, renamed: "fetchData()")
    func fetchData<T: Codable>(_ completion: @escaping(Result<T, Error>) -> Void) {
        guard let urlData = URL(string: "https://gist.githubusercontent.com/rigovides/12708f4aed26f847a0fe34f0fef1dbd7/raw/bb5a9a21f599acb2a46d01f45709d0aeb669f965/items.json") else {
            completion(.failure(NSError(domain: "invalid url", code: -1, userInfo: ["Description": "Invalid URL"]) as Error))
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: urlData)) { data, response, error in
            // Error?
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: urlData.absoluteString, code: ((response as? HTTPURLResponse)?.statusCode ?? -1), userInfo: ["Description": "Invalid data"]) as Error))
                return
            }
         
            // Valid data
            do {
                let items = try JSONDecoder().decode(T.self, from: data)
                completion(.success(items))
                
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    /// Automatic Xcode Async wrapper
    func fetchData<T: Codable>() async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            fetchData() { result in
                continuation.resume(with: result)
            }
        }
    }
    
    /// Async Away option #1
    func fetchToDoTasks() async throws -> [ToDoTask] {
        return try await withCheckedThrowingContinuation { continuation in
            fetchData { (result: Result<[ToDoTask], Error>) in
                continuation.resume(with: result)
            }
        }
    }
    
    /// Async Away option #2
    func fetchToDoTasksGeneric<T: Codable>() async throws -> T {
        guard let urlData = URL(string: "https://gist.githubusercontent.com/rigovides/12708f4aed26f847a0fe34f0fef1dbd7/raw/bb5a9a21f599acb2a46d01f45709d0aeb669f965/items.json") else {
            throw ApiError.invalidData
        }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: urlData))
        
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
