//
//  ContentView.swift
//  GeometryReader
//
//  Created by Manuel Salinas on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {

            HeaderView(title: "Geometry Reader", subtitle: "Alignment", desc: "GeometryReader is a container view that pushes out to fill up all available space. You use it to help with positioning items within it.")

            GeometryReader { proxy in

                VStack {

                    let minX = CGFloat(proxy.frame(in: .local).minX)
                    let minY = CGFloat(proxy.frame(in: .local).minY)

                    let maxX = CGFloat(proxy.frame(in: .local).maxX)
                    let maxY = CGFloat(proxy.frame(in: .local).maxY)


                    Image(systemName: "arrow.up.left")
                        .position(
                            x: minX + 40,
                            y: minY + 40
                        )


                    Image(systemName: "arrow.up.right")
                        .position(
                            x: maxX - 40,
                            y: minX - 70
                        )

                    Image(systemName: "arrow.down.left")
                        .position(
                            x: minX + 40,
                            y: proxy.size.height / 2
                        )

                    // another way to extract position
                    Image(systemName: "arrow.down.right")
                        .position(
                            x:  maxX - 40,
                            y: proxy.size.height / 4
                        )
                }
                .padding(.vertical)



                let middleX = CGFloat(proxy.frame(in: .local).midX)
                let middleY = CGFloat(proxy.frame(in: .local).midY)

                Image(systemName: "safari")
                    .position(
                        x: middleX,
                        y: middleY
                    )

            }
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(Color.pink)

        }
        .font(.title)
    }
}

#Preview {
    ContentView()
}
