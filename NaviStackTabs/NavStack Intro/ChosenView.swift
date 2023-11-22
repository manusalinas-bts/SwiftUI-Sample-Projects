//
//  ChosenView.swift
//  NavStackIntro
//
//  Created by Manuel Salinas on 11/16/23.
//

import SwiftUI

struct ChosenView: View {
    let item: String

    var body: some View {
        Text("You chose\n\(item)")
            .font(.largeTitle)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    ChosenView(item: "algo")
}
