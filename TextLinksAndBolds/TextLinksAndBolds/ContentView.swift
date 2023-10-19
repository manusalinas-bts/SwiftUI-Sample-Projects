//
//  ContentView.swift
//  TextLinksAndBolds
//
//  Created by Manuel Salinas on 7/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, **bold** world! Please tap [here](https://www.apple.com.mx) to go Apple Web site. We can also add _Italic_ style, ~Tachado~")
            .padding()
            .font(.system(size: 50))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
