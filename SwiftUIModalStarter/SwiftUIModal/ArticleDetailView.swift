//
//  ArticleDetailView.swift
//  SwiftUIModal
//
//  Created by Simon Ng on 19/8/2020.
//

import SwiftUI

struct ArticleDetailView: View {
    
    var article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                        
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
            
        }
        .overlay(FloatingCloseButton())
        
        .ignoresSafeArea(.all, edges: .top)
        
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: articles[0])
    }
}

struct FloatingCloseButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.down.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                })
                .padding(.trailing, 20)
                .padding(.top, 40)
                
                Spacer()
            }
        }
    }
}
