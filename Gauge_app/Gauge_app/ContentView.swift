//
//  ContentView.swift
//  Gauge_app
//
//  Created by Manuel Salinas on 8/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var speed = 0.5
    var body: some View {
        VStack {
            NavigationStack {
                
                Slider(value: $speed, in: 0...250) {
                    Text("Muevele")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("250")
                }
                
                ProgressView(value: speed) {
                    Text("Speed")
                }
                .padding()
                
                Gauge(value: speed) {
                    Text("Speed")
                }
                .padding()
                
                Gauge(value: speed, in: 0...250) {
                    Text("Speed")
                    
                } currentValueLabel: {
                    Text("\(Int(speed))")
                    
                } minimumValueLabel: {
                    Text("0")
                    
                } maximumValueLabel: {
                    Text("250")
                    
                }
                .padding()
                
                NavigationLink("Gauge View", destination: GaugesView())
                    .buttonStyle(.bordered)
                    .tint(.cyan)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
