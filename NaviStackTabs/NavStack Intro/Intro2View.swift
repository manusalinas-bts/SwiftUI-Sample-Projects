//
// Created for NavStackIntro1

//
import SwiftUI

struct Intro2View: View {

    @State private var path = NavigationPath()

    var body: some View {

        NavigationStack(path: $path) {
            VStack {
                NavigationLink(Author.sample[0].name, value: Author.sample[0].name)
                NavigationLink(Author.sample[1].name, value: Author.sample[1].numBooks)
                NavigationLink(Author.sample[2].name, value: Author.sample[2].color)
                NavigationLink(Author.sample[3].name, value: Author.sample[3])
                Button("Random") {
                    let randomAuthor = Author.sample.randomElement()!
                    path.append(randomAuthor)
                }
            }
            .buttonStyle(.bordered)
            .navigationTitle("NavigationLinks")
            .navigationDestination(for: String.self) { stringValue in
                Text(stringValue).font(.largeTitle)
            }
            .navigationDestination(for: Int.self) { intValue in
                Text("\(intValue) books").font(.largeTitle)
            }
            .navigationDestination(for: Color.self) { colorValue in
                colorValue
            }
            .navigationDestination(for: Author.self) { authorValue in
                ZStack {
                    authorValue.color
                    VStack {
                        Text(authorValue.name)
                        Text("\(authorValue.numBooks) books")
                    }
                    .font(.largeTitle)
                }
            }
        }
    }
}


#Preview {
    Intro2View()
}
