//
//  ContentView.swift
//  ObservableViewModelSample
//
//  Created by Manuel Salinas on 4/12/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ItemsViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // Navigation
            NavigationView {
                if viewModel.posts.isEmpty {
                    // Empty State  / Indicator
                    Text(viewModel.isLoading ? "Loading..." : "No Posts Found")
                        .font(.callout)
                        .padding()
                        .foregroundColor(.gray)
                        .navigationTitle("Posts")
                } else {
                    // Table
                    List(viewModel.posts) { post in
                        Text(post.title)
                    }
                    .listStyle(.plain)
                    .navigationTitle("Posts")
                }
            }
            
            // Buttons
            ActionButtonsView(vm: viewModel)
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
