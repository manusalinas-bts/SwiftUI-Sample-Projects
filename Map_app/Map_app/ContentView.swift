//
//  ContentView.swift
//  Map_app
//
//  Created by Manuel Salinas on 8/1/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        // * * Form #1
        // Map(initialPosition: .region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))))
        
        // * * Form #2
        // Map(initialPosition: .item(MKMapItem(placemark: .init(coordinate: .bigBen))))
        
        // * * Form #3
        Map(position: $position) {
            Marker("My Marker", coordinate: .bigBen)
            
            Annotation("My Annotation",
                       coordinate: .towerBridge,
                       anchor: .bottom) {
                ZStack {
                    Circle()
                        .foregroundStyle(.cyan.opacity(0.5))
                        .frame(width: 80, height: 80)
                    
                    Image(systemName: "car.front.waves.up")
                        .symbolEffect(.variableColor)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.cyan)
                        .clipShape(Circle())
                }
            }
        }
        .onAppear {
            position = .item(MKMapItem(placemark: .init(coordinate: .bigBen)))
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                Button(action: {
                    withAnimation {
                        position = .camera(MapCamera(
                            centerCoordinate: .bigBen,
                            distance: 800,
                            heading: 90,
                            pitch: 50))
                    }
                }) {
                    Text("Big Ben")
                }
                .tint(.black)
                .buttonStyle(.borderedProminent)
                
                Button(action: {
                    withAnimation {
                        position = .camera(MapCamera(
                            centerCoordinate: .towerBridge,
                            distance: 800,
                            heading: 90,
                            pitch: 50))
                    }
                }) {
                    Text("Tower Bridge")
                }
                .tint(.black)
                .buttonStyle(.borderedProminent)
            }
        }
        //.mapStyle(.imagery(elevation: .realistic))
        .mapStyle(.hybrid)
        
    }
}

#Preview {
    ContentView()
}


extension CLLocationCoordinate2D {
    static let bigBen = CLLocationCoordinate2D(latitude: 51.500685, longitude: -0.124570)
    static let towerBridge = CLLocationCoordinate2D(latitude: 51.505507, longitude: -0.075402)
    
}
