//
//  FormTextView.swift
//  FoodPin
//
//  Created by Manuel Salinas on 11/1/23.
//

import SwiftUI

struct FormTextView: View {
    let label: String

    @Binding var value: String

    var height: CGFloat = 200.0

    var body: some View {
        VStack(alignment: .leading) {
            Text(label.uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundColor(Color(.darkGray))

            TextEditor(text: $value)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .padding(.top, 10)

        }
    }
}

#Preview {
    FormTextView(
        label: "DESCRIPTION",
        value: .constant(""),
        height: 100
    )
}
