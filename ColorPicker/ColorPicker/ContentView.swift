//
//  ContentView.swift
//  ColorPicker
//
//  Created by Manuel Salinas on 11/16/23.
//

import SwiftUI

struct ContentView: View {

    @State private var selectedColor: Color = .white
    @State private var selectedDate = Date()

    var body: some View {
        VStack {
            HeaderView(title: "Color Picker",
                       subtitle: "Intro",
                       desc: "Use the ColorPicker to provide your users with color options. You will need to bind it to a color variable to store the color selected",
                       color: selectedColor)

            Text(selectedDate.formatted())
                .font(.title.bold())

            Divider()
            Spacer()

            RoundedRectangle(cornerRadius: 10)
                .fill(selectedColor.opacity(0.2))
                .frame(height: 100)
                .overlay {
                    ColorPicker("Select a Color", selection: $selectedColor)
                        .padding()
                }
                .font(.title)
                .padding()

            Spacer()

            DatePicker("Select Date", selection: $selectedDate)
                .font(.title2)
                .padding()
        }
        .background(selectedColor.opacity(0.1))
    }
}

#Preview {
    ContentView()
}
