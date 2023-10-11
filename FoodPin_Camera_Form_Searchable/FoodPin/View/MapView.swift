//
//  MapView.swift
//  FoodPin
//
//  Created by Simon Ng on 30/9/2021.
//

import SwiftUI
import MapKit

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var location: String = ""
    var interactionModes: MapInteractionModes = .all
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.510357, longitude: -0.116773), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
    @State private var annotatedItem: AnnotatedItem = AnnotatedItem(coordinate: CLLocationCoordinate2D(latitude: 51.510357, longitude: -0.116773))
    
    var body: some View {
        
        Map(coordinateRegion: $region, interactionModes: interactionModes, annotationItems: [annotatedItem]) { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        }
        .task {
            convertAddress(location: location)
        }
    
    }
    
    private func convertAddress(location: String) {
        
        // Get location
        let geoCoder = CLGeocoder()

        geoCoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let placemarks = placemarks,
                  let location = placemarks[0].location else {
                return
            }
            
            self.region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))

            self.annotatedItem = AnnotatedItem(coordinate: location.coordinate)
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: "54 Frith Street London W1D 4SL United Kingdom")
    }
}
