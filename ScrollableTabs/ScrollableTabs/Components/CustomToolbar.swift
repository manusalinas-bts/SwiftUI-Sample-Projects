//
//  CustomToolbar.swift
//  ScrollableTabs
//
//  Created by Manuel Salinas on 11/10/23.
//

import SwiftUI

struct CustomToolbar: View {
    var body: some View {
        HStack {
            Button(action: { }, label: {
                Image(systemName: "line.3.horizontal.decrease")
            })

            Spacer()

            Button(action: { }, label: {
                Image(systemName: "bell.badge")
            })
        }
        .font(.title2)
        .foregroundStyle(.primary)
        .overlay {
            Text("Message")
                .font(.title3.bold())
        }
        .padding(15)
    }
}

#Preview {
    CustomToolbar()
}
