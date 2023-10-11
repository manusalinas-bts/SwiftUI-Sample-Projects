//
//  DetailCounter.swift
//  BindingApp
//
//  Created by Manuel Salinas on 7/24/23.
//

import SwiftUI

// Number Effect needs 2 steps
/*
 1.- .contentTransition(.numericText(value:
 2.- .animation(.easeInOut(duration: 0.1), value:
 */

struct DetailCounter: View {
    @Binding var counter: Int
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Spacer()
                
                Text("El contador esta en:")
                    .font(.title2)
                    .foregroundColor(.brown)
                
                Text("\(counter)")
                    .font(.system(size: 280))
                    .foregroundColor(.brown)
                    .contentTransition(.numericText(value: Double(counter))) // * Step 1 *
                
                Divider()
                    .padding()
                
                SumButton(counter: $counter)
            }
            .padding()
            .animation(.easeInOut(duration: 0.1), value: counter) // * Step 2 *
        }
    }
    
   
}

struct DetailCounter_Previews: PreviewProvider {
    static var previews: some View {
        DetailCounter(counter: .constant(0))
    }
}


