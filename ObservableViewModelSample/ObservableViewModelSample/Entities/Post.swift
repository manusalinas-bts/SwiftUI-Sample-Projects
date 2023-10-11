//
//  Post.swift
//  ObservableViewModelSample
//
//  Created by Manuel Salinas on 4/12/23.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
