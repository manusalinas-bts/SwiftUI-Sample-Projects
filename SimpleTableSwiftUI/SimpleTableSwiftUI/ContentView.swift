//
//  ContentView.swift
//  SimpleTableSwiftUI
//
//  Created by Manuel Salinas on 6/7/22.
//

import SwiftUI

struct ContentView: View {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var body: some View {
        List {
            ForEach(restaurantNames, id: \.self) { restaurant in
                HStack (spacing: 10) {
                    Image(restaurant)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
                    
                    Text(restaurant)
                }
            }
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
