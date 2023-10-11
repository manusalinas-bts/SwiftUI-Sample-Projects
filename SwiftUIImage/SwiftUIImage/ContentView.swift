//
//  ContentView.swift
//  SwiftUIImage
//
//  Created by Simon Ng on 3/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .overlay(
                Color.black
                    .opacity(0.4)
                    .overlay(
                        Text("Paris")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .frame(width: 200)
                    )
            )
    }
}

struct SymbolView: View {
    var body: some View {
        Image(systemName: "cloud.sun.rain")
            .symbolRenderingMode(.palette)
            .foregroundStyle(.yellow, .blue, .tertiary)
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        SymbolView()
            .previewLayout(.sizeThatFits)
    }
}
