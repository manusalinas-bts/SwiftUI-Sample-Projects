//
//  GaugesView.swift
//  Gauge_app
//
//  Created by Manuel Salinas on 8/15/23.
//

import SwiftUI

struct GaugesView: View {
    @State private var celcius = 32.0
    
    private let minValue = 0.0
    private let maxValue = 100.0
    
    private let gradient = Gradient(colors: [.green, .yellow, .red])
    
    var body: some View {
        VStack {
            Text("GAUGES")
                .bold().font(.largeTitle)
            
            Slider(value: $celcius, in: minValue...maxValue)
            .padding()
            
            Divider()
            
            Group {
                // *1*
                Gauge(value: celcius, in: minValue...maxValue) {
                    Label("Temperature (°C)", systemImage: "thermometer.medium")
                } currentValueLabel: {
                    Text(Int(celcius), format: .number)
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("100")
                }
                
                // *2*
                Gauge(value: celcius, in: minValue...maxValue) {
                    Label("Temperature (°C)", systemImage: "thermometer.medium")
                }
            }
            .padding()
            .gaugeStyle(.accessoryCircular)
            .tint(gradient)
          
            Group {
                // *3*
                Gauge(value: celcius, in: minValue...maxValue) {
                    Label("Temperature (°C)", systemImage: "thermometer.medium")
                } currentValueLabel: {
                    Text(Int(celcius), format: .number)
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("100")
                }
                
                // *4*
                Gauge(value: celcius, in: minValue...maxValue) {
                    Label("Temperature (°C)", systemImage: "thermometer.medium")
                }
            }
            .padding()
            .gaugeStyle(.accessoryLinear)
            .tint(gradient)
            
            Group {
                // *5*
                Gauge(value: celcius, in: minValue...maxValue) {
                    Label("Temperature (°C)", systemImage: "thermometer.medium")
                } currentValueLabel: {
                    Text(Int(celcius), format: .number)
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("100")
                }
                
                // *6*
                Gauge(value: celcius, in: minValue...maxValue) {
                    Label("Temperature (°C)", systemImage: "thermometer.medium")
                }
            }
            .padding()
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(gradient)
        }
        
    }
}

#Preview {
    GaugesView()
}
