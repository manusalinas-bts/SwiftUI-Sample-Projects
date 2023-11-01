//
//  RestaurantFormViewModel.swift
//  FoodPin
//
//  Created by Simon Ng on 20/10/2022.
//

import Foundation
import Observation
import UIKit

@Observable
final class RestaurantFormViewModel {
    var name: String = ""
    var type: String = ""
    var location: String = ""
    var phone: String = ""
    var description: String = ""
    var image: UIImage = UIImage(named: "newphoto")!

    init(restaurant: Restaurant? = nil) {

        if let restaurant = restaurant {
            self.name = restaurant.name
            self.type = restaurant.type
            self.location = restaurant.location
            self.phone = restaurant.phone
            self.description = restaurant.summary
            self.image = UIImage(data: restaurant.image) ?? UIImage()
        }

    }
}
