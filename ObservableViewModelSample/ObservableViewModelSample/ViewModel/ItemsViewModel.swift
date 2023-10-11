//
//  ItemsViewModel.swift
//  ObservableViewModelSample
//
//  Created by Manuel Salinas on 4/12/23.
//

import SwiftUI

let apiUrl = "https://jsonplaceholder.typicode.com/posts"

class ItemsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading: Bool = false
    
    func clear() {
        posts.removeAll()
    }
    
    func getPosts() {
        // Fetch, Decode and Update array
        guard let url = URL(string: apiUrl) else { return }

        URLSession.shared.dataTask(with: URLRequest(url: url)) { datos, response, error  in
            DispatchQueue.main.async { self.isLoading = false }
            
                if let data = datos {
                    do {
                        let info = try JSONDecoder().decode([Post].self, from: data)
                        DispatchQueue.main.async { self.posts = info }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
        }
        .resume()
    }
}
