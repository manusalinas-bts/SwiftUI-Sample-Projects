//
//  ContentView.swift
//  SwiftUIStacks
//
//  Created by Manuel Salinas on 7/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Plans
        ZStack {
            PricingView(title: "Basic",
                        price: "$9",
                        textColor: .white,
                        bgColor: .purple,
                        icon: "star.fill")
            .padding()
            .offset(x: 0, y: 180)
            
            PricingView(title: "Pro",
                        price: "$19",
                        textColor: .black,
                        bgColor:Color(red: 255/255, green: 183/255, blue: 37/255),
                        icon: "wand.and.rays")
            .padding()
            .scaleEffect(0.95)
            
            PricingView(title: "Team",
                        price: "$299",
                        textColor: .white,
                        bgColor: Color(red: 62/255, green: 63/255, blue: 70/255),
                        icon: "person.3.sequence.fill")
            .padding()
            .offset(x: 0, y: -180)
            .scaleEffect(0.90)
        }
    }
}

// MARK: - RENDER
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - SUBVIEWS
struct HeaderView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                
                Text(subtitle)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            Spacer()
        }
        .padding()
    }
}

struct PricingView: View {
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    
    var body: some View {
        VStack {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.subheadline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}

struct TagNote: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.system(.caption, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(5)
            .background(Color(red: 255/255, green: 183/255, blue: 37/255))
            .offset(x: 0, y: 87)
    }
}
