//
//  EmptyViewIcon.swift
//  TabBarApp
//
//  Created by Manuel Salinas on 8/11/23.
//

import SwiftUI

struct EmptyViewIcon: View {
    var systemIconName: String
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: systemIconName)
                .resizable()
                .scaledToFit()
                .padding()
                .foregroundStyle(.yellow)            
            
            Spacer()
        }
        .navigationTitle(systemIconName)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.green.opacity(0.5), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
        .background(.black.opacity(0.8))
        .ignoresSafeArea()
    }
}

struct EmptyViewIcon_Previews: PreviewProvider {
    static var previews: some View {
        EmptyViewIcon(systemIconName: "personalhotspot")
    }
}
