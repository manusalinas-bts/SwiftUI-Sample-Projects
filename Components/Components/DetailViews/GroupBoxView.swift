//
//  GroupBoxView.swift
//  Components
//
//  Created by Manuel Salinas on 11/21/23.
//

import SwiftUI

struct GroupBoxView: View {
    var title: String?
    
    @State private var username = ""
    @State private var password = ""

    var body: some View {

        GroupBox {
            Text("Login")

            TextField("Username", text: $username)                    .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)                    .textFieldStyle(.roundedBorder)
        }
        .font(.title2)
        .padding(.horizontal)
        .modifier(NavigationStyledModifier(title: title))
    }
}

#Preview {
    GroupBoxView()
}
