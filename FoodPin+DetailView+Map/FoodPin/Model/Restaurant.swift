//
//  Restaurant.swift
//  FoodPin
//
//  Created by Simon Ng on 27/9/2021.
//

import Foundation

struct Restaurant {
    
    enum Rating: String, CaseIterable {
        case awesome
        case good
        case okay
        case bad
        case terrible

        var image: String {
            switch self {
            case .awesome: return "love"
            case .good: return "cool"
            case .okay: return "happy"
            case .bad: return "sad"
            case .terrible: return "angry"
            }
        }
    }

    var name: String
    var type: String
    var location: String
    var phone: String
    var description: String
    var image: String
    var isFavorite: Bool
    
    init(name: String, type: String, location: String, phone: String, description: String, image: String, isFavorite: Bool = false) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.description = description
        self.image = image
        self.isFavorite = isFavorite
    }
    
    init() {
        self.init(name: "", type: "", location: "", phone: "", description: "", image: "", isFavorite: false)
    }
}
