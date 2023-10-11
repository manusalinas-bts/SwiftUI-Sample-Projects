//
//  ProgramaticNextButton.swift
//  TabBarApp
//
//  Created by Manuel Salinas on 8/11/23.
//

import SwiftUI

struct ProgramaticNextButton: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        Button {
            selectedIndex = (selectedIndex + 1) % 4
        } label: {
            Text("Next")
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.black)
                .background(Color.yellow)
                .cornerRadius(10.0)
                .padding()
        }
    }
}

struct ProgramaticNextButton_Previews: PreviewProvider {
    static var previews: some View {
        ProgramaticNextButton(selectedIndex: .constant(0))
    }
}
