//
//  MapView.swift
//  FoodPin
//
//  Created by Manuel Salinas on 6/24/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    var location: String = ""
    var interaction: MapInteractionModes
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.510357, longitude: -0.116773), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
    
    @State private var annotatedItem: AnnotatedItem = AnnotatedItem(coordinate: CLLocationCoordinate2D(latitude: 21.103566, longitude: -101.718763))
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: [interaction], annotationItems: [annotatedItem]) { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
            
        }
        .task {
            convertAddress(location)
        }
    }
    
    
    private func convertAddress(_ location: String) {
        
        // Get location
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(location) { placemarks, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let placemarks = placemarks,
                  let location = placemarks[0].location else {
                return
            }
            
            self.annotatedItem = AnnotatedItem(coordinate: location.coordinate)
            self.region = MKCoordinateRegion(center: location.coordinate,
                                             span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))
            
        }
    }
}

// MARK: - PREVIEWS
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: "Las Flores 110, Leon, Mexico", interaction: .all)
    }
}
