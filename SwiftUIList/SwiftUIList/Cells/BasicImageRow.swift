//
//  BasicImageRow.swift
//  SwiftUIList
//
//  Created by Manuel Salinas on 8/8/22.
//

import SwiftUI

struct BasicImageRow: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            
            Text(restaurant.name)
        }
    }
}

struct BasicImageRow_Previews: PreviewProvider {
    static var previews: some View {
        let resto = Restaurant(name: "Cafe Deadend", image: "cafedeadend")
        BasicImageRow(restaurant: resto)
    }
}
