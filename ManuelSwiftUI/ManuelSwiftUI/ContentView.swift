//
//  ContentView.swift
//  ManuelSwiftUI
//
//  Created by Manuel Salinas on 6/6/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Voz Parlante")
                .fontWeight(.black)
                .font(.largeTitle)
                .padding()
            
            Text("Presiona cualquier boton para escuchar su titulo")
                .fontWeight(.light)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            Button {
              speak(text: "Hola Mundo")
            } label: {
                Text("Hola mundo!")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .padding()
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(20)
            
            Button {
                speak(text: "Como estas?")
            } label: {
                Text("Como estas?")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .padding()
            }
            .padding()
            .foregroundColor(.white)
            .background(.red)
            .cornerRadius(20)
        }
        
    }
}

func speak(text: String) {
    let utterance = AVSpeechUtterance(string: text)
    utterance.voice = AVSpeechSynthesisVoice(language: "es-la")
    
    let synthesizer = AVSpeechSynthesizer()
    synthesizer.speak(utterance)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
