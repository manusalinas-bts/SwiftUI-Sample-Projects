//
//  FormTextField.swift
//  FoodPin
//
//  Created by Manuel Salinas on 11/1/23.
//

import SwiftUI

struct FormTextField: View {
    let label: String
    var placeholder: String = ""

    @Binding var value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label.uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundColor(Color(.darkGray))

            TextField(placeholder, text: $value)
                .font(.system(.body, design: .rounded))
                .textFieldStyle(PlainTextFieldStyle())
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .padding(.vertical, 10)

        }
    }
}

#Preview {
    FormTextField(label: "Email address", placeholder: "mail@mail.com", value: .constant(""))
}
