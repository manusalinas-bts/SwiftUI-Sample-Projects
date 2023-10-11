//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Simon Ng on 19/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            List(articles) { article in
                ZStack {
                    
                    ArticleRow(article: article)
                    
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        EmptyView()
                    }
                    .opacity(0)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationBarTitle("Your Reading")
        }
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
