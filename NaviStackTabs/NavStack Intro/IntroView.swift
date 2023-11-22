//
// Created for NavStackIntro1

//

import SwiftUI

struct IntroView: View {
    let items = ["🍎", "🍐", "🍋", "🍑", "🍌", "🍉", "🍇", "🍒", "🫐", "🍓"]
    var body: some View {
        NavigationStack {
            VStack {
                List(items, id: \.self) { fruit in
                    NavigationLink("I choose \(fruit)", value: fruit)
                }

                HStack {
                    NavigationLink("Tap to show preferred", value: items[7])

                    NavigationLink(value: "😀") {
                        Text("Other")
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Fruit of the Day")
            .navigationDestination(for: String.self) { stringValue in
                ChosenView(item: stringValue)
            }
        }
    }
}

#Preview {
    IntroView()
}
