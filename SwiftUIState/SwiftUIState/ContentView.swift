//
//  ContentView.swift
//  SwiftUIState
//
//  Created by Manuel Salinas on 8/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counter1 = 0
    @State private var counter2 = 0
    @State private var counter3 = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 150)
            
            Text("\(counter1 + counter2 + counter3)")
                .font(.system(size: 200, weight: .bold, design: .rounded))
            
            HStack(alignment: .center) {
                CounterButton(counter: $counter1, color: .blue)
                CounterButton(counter: $counter2, color: .red)
                CounterButton(counter: $counter3, color: .green)
            }
            Spacer(minLength: 150)
        }
        .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CounterButton: View {
    
    @Binding var counter: Int
    var color: Color
    
    var body: some View {
        Button {
            // Sum
            self.counter += 1
        } label: {
            Circle()
                .foregroundColor(color)
                .overlay {
                    Text("\(counter)")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                }
        }
    }
}
