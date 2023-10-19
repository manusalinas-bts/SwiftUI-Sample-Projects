//
//  ContentView.swift
//  SwiftUIScrollView
//
//  Created by Manuel Salinas on 8/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Monday November 28, 2022")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    Text("Your Reading")
                        .font(.system(size: 35,
                                      weight: .heavy,
                                      design: .rounded))
                }
                Spacer()
            }
            .padding()
            
            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack {
                    Group {
                        CardView(image: "swiftui-button",
                                 category: "SwiftUI",
                                 heading: "Drawing a Border with Rounded Corners",
                                 author: "Simon Ng")
                        
                        CardView(image: "macos-programming",
                                 category: "macOS",
                                 heading: "Building a Simple Editing App",
                                 author: "Gabriel Theodoropoulos")
                        
                        CardView(image: "flutter-app",
                                 category: "Flutter",
                                 heading: "Building a Complex Layout with Flutter",
                                 author: "Lawrence Tan")
                        
                        CardView(image: "natural-language-api",
                                 category: "iOS",
                                 heading: "What's New in Natural Language API",
                                 author: "Sai Kambampati")
                    }
                    .frame(width: 300)
                }
            }
            Spacer()
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Subviews
