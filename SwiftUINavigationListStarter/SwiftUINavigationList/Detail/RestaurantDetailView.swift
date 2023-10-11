//
//  RestaurantDetailView.swift
//  SwiftUINavigationList
//
//  Created by Manuel Salinas on 8/8/22.
//

import SwiftUI

struct RestaurantDetailView: View {
    var restaurant: Restaurant

    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)

            Spacer()
        }
        // Custom back button action
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(title: restaurant.name))
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let resto = Restaurant(name: "Cafe Deadend", image: "cafedeadend")
        RestaurantDetailView(restaurant: resto)
    }
}

struct BackButton: View {
    var title: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button {
            dismiss()
        } label:  {
            Text("\(Image(systemName: "chevron.left")) \(title)")
                .foregroundColor(.black)
        }
    }
}
