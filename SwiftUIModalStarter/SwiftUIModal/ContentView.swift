//
//  ContentView.swift
//  SwiftUIModal
//
//  Created by Simon Ng on 19/8/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var showDetailView = false
    @State var selectedArticle: Article?
    
    var body: some View {
        NavigationView {
            List(articles) { article in
                ArticleRow(article: article)
                    .onTapGesture {
                        showDetailView = true
                        selectedArticle = article
                    }
                
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
             //modal card screen
            .sheet(item: $selectedArticle) { article in
                ArticleDetailView(article: article)
            }
            // modal Full screen
//            .fullScreenCover(item: $selectedArticle) { article in
//                ArticleDetailView(article: article)
//            }
            
            
            
            .navigationBarTitle("Your Reading")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

