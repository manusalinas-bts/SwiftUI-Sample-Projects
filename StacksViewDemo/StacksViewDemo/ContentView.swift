//
//  ContentView.swift
//  StacksViewDemo
//
//  Created by Manuel Salinas on 6/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            BodyScreen()
        }
    }
}

struct BodyScreen: View {
    @Environment (\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        VStack(spacing: 20) {
            TitleHeader()
            Developers()
            Text("Need help with coding problems? Register!")
                .foregroundColor(verticalSizeClass == .compact ? . black : .white)
            Spacer()
            
            // Landscape?
            if verticalSizeClass == .compact {
                HorizontalLoginButtons()
            } else {
                VerticalLoginButtons()
            }
            
        }
        .padding(.top, 30)
    }
}

struct TitleHeader: View {
    var body: some View {
        VStack {
            Text("Better Call Leo")
                .fontWeight(.medium)
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            Text("Get help from experts in 15 minutes")
                .foregroundColor(.white)
        }
    }
}

struct Developers: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            Image("user1")
                .resizable()
                .scaledToFit()
            
            Image("user2")
                .resizable()
                .scaledToFit()
            
            Image("user3")
                .resizable()
                .scaledToFit()
        }
        .padding(.horizontal, 20)
    }
}

struct VerticalLoginButtons: View {
    var body: some View {
        VStack(spacing: 20) {
            Button {
                print("Tap")
            } label: {
                Text("Log in")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            
            Button {
                print("Tap")
            } label: {
                Text("Sign Up")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(.indigo)
            .cornerRadius(10)
            
        }
    }
}

struct HorizontalLoginButtons: View {
    var body: some View {
        HStack(spacing: 20) {
            Button {
                print("Tap")
            } label: {
                Text("Log in")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            
            Button {
                print("Tap")
            } label: {
                Text("Sign Up")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(.indigo)
            .cornerRadius(10)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")
            
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
