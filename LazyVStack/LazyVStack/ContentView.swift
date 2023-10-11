//
//  ContentView.swift
//  LazyVStack
//
//  Created by Manuel Salinas on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                Section {
                    ForEach(0..<50) {
                        RowView(title: " Pista \($0 + 1)")
                    }
                } header: {
                    HeaderView()
                } footer: {
                    FooterView()
                }
            }
            .background(Color.indigo.opacity(0.1))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RowView: View {
    var title: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "figure.run.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.indigo.opacity(0.5))

            Text(title)
                .font(.title2)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "bolt.horizontal.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.white.opacity(0.5))

            Text("Header")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.indigo)
    }
}

struct FooterView: View {
    var body: some View {
        HStack(spacing: 12) {
            Spacer()
            
            Text("Footer")
                .font(.title)
                .foregroundColor(.white)
            
            Image(systemName: "bolt.horizontal.fill")
                .resizable()
                .frame(width: 35, height: 15)
                .foregroundColor(.white.opacity(0.5))
//
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.indigo)
    }
}
