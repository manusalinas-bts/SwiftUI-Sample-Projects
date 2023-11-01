//
//  ContentDetailView.swift
//  AppStorage
//
//  Created by Manuel Salinas on 11/1/23.
//

import SwiftUI

struct ContentDetailView: View {
    @AppStorage("username") var name: String!
    @State private var newUsername = ""

    var body: some View {
        VStack {
            Text("Current value → \(name)")
                .font(.subheadline)
                .foregroundStyle(.gray)

            TextField("username", text: $newUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.gray.opacity(0.2))
                }
                .submitLabel(.send)
                .onSubmit {
                    saveUsername()
                }

            Button(action: {
                saveUsername()
            }) {
                Text("Persist")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(
                        Capsule().fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.blue, Color.purple]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    )
            }

            Spacer()
        }
        .padding()
    }

    private func saveUsername() {
        guard !newUsername.isEmpty else { return }
        name = newUsername
    }

}

#Preview {
    ContentDetailView()
}
