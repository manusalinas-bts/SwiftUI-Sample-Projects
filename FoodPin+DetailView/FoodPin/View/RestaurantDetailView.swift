//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Simon Ng on 28/9/2021.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.dismiss) var dismissScreen
    
    var restaurant: Restaurant
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Restaurant image
                Image(restaurant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .ignoresSafeArea()
                    .overlay {
                        // Favorite icon
                        VStack {
                            Image(systemName: "heart.fill")
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                                .padding()
                                .font(.system(size: 30))
                                .foregroundColor(restaurant.isFavorite ? .yellow : .white)
                                .padding(.top, 40)
                            
                            // Restaurant title
                            VStack(alignment: .leading, spacing: 5) {
                                Text(restaurant.name)
                                    .font(.custom("Nunito-Regular", size: 35, relativeTo: .largeTitle))
                                    .bold()
                                Text(restaurant.type)
                                    .font(.system(.headline, design: .rounded))
                                    .padding(.all, 5)
                                    .background(.black)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                            .foregroundColor(.white)
                            .padding()
                        }
                    }
                
                // Restaurant description
                Text(restaurant.description)
                    .padding()
                
                // Address and Tel
                AddressPhoneView(location: restaurant.location,
                                 phone: restaurant.phone)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismissScreen()
                    } label: {
                        Text("\(Image(systemName: "chevron.left"))")
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - VIEWS
struct AddressPhoneView: View {
    var location: String
    var phone: String
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("ADDRESS")
                    .font(.system(.headline, design: .rounded))
                
                Text(location)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading) {
                Text("PHONE")
                    .font(.system(.headline, design: .rounded))
                
                Text(phone)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
    }
}

// MARK: - PREVIEWS
struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", image: "cafedeadend", isFavorite: false))
    }
}
