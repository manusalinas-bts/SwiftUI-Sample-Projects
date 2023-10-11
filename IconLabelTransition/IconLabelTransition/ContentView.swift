//
//  ContentView.swift
//  IconLabelTransition
//
//  Created by Manuel Salinas on 6/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Image Effects")
                .fontWeight(.bold)
                .font(.largeTitle)
            
            Spacer()
            
            Image(systemName: "cloud.sun.rain.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.pulse)
            
            Spacer()
            
            Image(systemName: "car.front.waves.up")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .symbolEffect(.variableColor)
            
            Spacer()
            
            Image(systemName: "antenna.radiowaves.left.and.right.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.variableColor)
            
            Spacer()
            
            Image(systemName: "touchid")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.variableColor)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
