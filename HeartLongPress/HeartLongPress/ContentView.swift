//
//  ContentView.swift
//  HeartLongPress
//
//  Created by Manuel Salinas on 7/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sizeHeart = false
    @State private var colorHeart = false
    
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 200))
            .foregroundColor(colorHeart ? .red : .yellow)
            .scaleEffect(sizeHeart ? 1.5 : 1)
            .animation(.default)
            .onTapGesture {
                self.colorHeart.toggle()
            }
            .onLongPressGesture {
                self.sizeHeart.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
