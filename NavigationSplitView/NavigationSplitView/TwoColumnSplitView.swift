//
//  TwoColumnSplitView.swift
//  NavigationSplitView
//
//  Created by Manuel Salinas on 5/24/23.
//

import SwiftUI

struct TwoColumnSplitView: View {
    private var dataModel = MenuProvider()
    
    @State private var selectedCategoryId: MenuItem.ID?
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(dataModel.mainMenuItems, selection: $selectedCategoryId) { item in
                HStack {
                    Image(systemName: item.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    
                    Text(item.name)
                        .font(.system(.title3, design: .rounded))
                        .bold()
                }
            }
            .navigationTitle("Activitites")
        } detail: {
            if let selectedCategoryId,
               let categoryItems = dataModel.subMenuItems(for: selectedCategoryId) {
                
                List(categoryItems) { item in
                    HStack {
                        Image(systemName: item.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        
                        Text(item.name)
                            .font(.system(.title3, design: .rounded))
                            .bold()
                    }
                }
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Detail")
                
            } else {
                Text("Please select a category")
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

struct TwoColumnSplitView_Previews: PreviewProvider {
    static var previews: some View {
        TwoColumnSplitView()
    }
}
