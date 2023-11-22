//
//  HeaderView.swift
//  GeometryReader
//
//  Created by Manuel Salinas on 11/16/23.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    var subtitle: String
    var desc: String
    var color: Color = .clear

    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.largeTitle)

            Text(subtitle)
                .font(.title)
                .foregroundStyle(.gray)

            Text(desc)
                .font(.title3)
        }
        .background(color)
        .padding()
    }
}

#Preview {
    HeaderView(
        title: "Geometry Reader",
        subtitle: "Introduction",
        desc: "GeometryReader is a container view that pushes out to fill up all available space. You use it to help with positioning items within it."
    )
}
