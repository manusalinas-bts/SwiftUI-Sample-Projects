//
//  CardView.swift
//  SwiftUIScrollView
//
//  Created by Manuel Salinas on 8/3/22.
//

import SwiftUI

struct CardView: View {
    var image: String
    var category: String
    var heading: String
    var author: String
    
    var body: some View {
        VStack {
            // Image
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            // Info
            HStack {
                VStack(alignment: .leading) {
                    Text(category)
                            .font(.headline)
                            .foregroundColor(.secondary)
                    
                        Text(heading)
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                            .minimumScaleFactor(0.5)
                    
                        Text(author.uppercased())
                            .font(.caption)
                            .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .padding([.top, .horizontal])
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "swiftui-button",
                 category: "SwiftUI",
                 heading: "Drawing a Border with Rounded Corners",
                 author: "Written by Simon Ng")
    }
}
