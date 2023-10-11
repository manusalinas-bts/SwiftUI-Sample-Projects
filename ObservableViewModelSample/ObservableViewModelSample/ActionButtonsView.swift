//
//  ActionButtonsView.swift
//  ObservableViewModelSample
//
//  Created by Manuel Salinas on 4/12/23.
//

import SwiftUI

struct ActionButtonsView: View {
    @ObservedObject var vm: ItemsViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            Button("Clear") {
                vm.clear()
            }
            .font(.title2)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.red)
            .foregroundColor(.white)
            .ignoresSafeArea()
            
            Button("Fetch Posts") {
                vm.isLoading = true
                vm.posts.removeAll()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.vm.getPosts()
                }
            }
            .font(.title2)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.indigo)
            .foregroundColor(.white)
            .ignoresSafeArea()
        }
    }
}

struct ActionButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonsView(vm: ItemsViewModel())
    }
}
