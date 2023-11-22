//
// Created for NavStackIntro1

//

import SwiftUI

struct StartTab: View {
    var body: some View {
        TabView() {
            IntroView()
                .tabItem {
                    Label("Introduction",systemImage: "1.circle.fill")
                }
            Intro2View()
                .tabItem {
                    Label("NavigationLinks",systemImage: "2.circle.fill")
                }
        }
    }
}

#Preview {
    StartTab()
}
