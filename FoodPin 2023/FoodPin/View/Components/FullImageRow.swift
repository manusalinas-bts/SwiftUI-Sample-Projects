//
//  FullImageRow.swift
//  FoodPin
//
//  Created by Manuel Salinas on 11/1/23.
//

import SwiftUI

struct FullImageRow: View {
    var imageName: String
    var name: String
    var type: String
    var location: String

    @Binding var isFavorite: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(20)

            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.system(.title2, design: .rounded))

                    Text(type)
                        .font(.system(.body, design: .rounded))

                    Text(location)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.gray)
                }

                if isFavorite {
                    Spacer()

                    Image(systemName: "heart.fill")
                        .foregroundColor(.yellow)
                }

            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

#Preview {
    return FullImageRow(imageName: "cafedeadend", name: "Cafe Deadend", type: "Cafe", location: "Hong Kong", isFavorite: .constant(true))
        .previewLayout(.sizeThatFits)
        .previewDisplayName("FullImageRow")
}
