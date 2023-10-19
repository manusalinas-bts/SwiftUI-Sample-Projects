//
//  ContentView.swift
//  ObservedObject
//
//  Created by Manuel Salinas on 6/27/23.
//

import SwiftUI

@Observable
class UserProgress {
    var score = 0
}

struct InnerView: View {
    @Bindable var progress: UserProgress

    var body: some View {
        Button("Increase") {
            if progress.score < 21 {
                progress.score += 1
            }
        }
        .buttonStyle(.bordered)
        .tint(.yellow)
        .font(.title2)
    }
}

struct ContentView: View {
    @State var progress = UserProgress()
    
    var body: some View {
        VStack {
            Text("Your score is\n\(progress.score)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            InnerView(progress: progress)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
