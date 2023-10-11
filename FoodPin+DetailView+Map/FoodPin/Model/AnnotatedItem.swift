//
//  AnnotatedItem.swift
//  FoodPin
//
//  Created by Manuel Salinas on 6/24/22.
//

import Foundation
import MapKit

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}
