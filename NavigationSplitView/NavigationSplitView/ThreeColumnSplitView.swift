//
//  ThreeColumnSplitView.swift
//  NavigationSplitView
//
//  Created by Manuel Salinas on 5/24/23.
//

import SwiftUI

struct ThreeColumnSplitView: View {
    private var dataModel = MenuProvider()
    
    @State private var selectedCategoryId: MenuItem.ID?
    @State private var selectedItem: MenuItem?
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
            .navigationTitle("Activities")
            
        } content: {
            
            if let selectedCategoryId,
               let subMenuItems = dataModel.subMenuItems(for: selectedCategoryId) {
                List(subMenuItems, selection: $selectedItem) { item in
                    NavigationLink(value: item) {
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
                }
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
                
            } else {
                Text("Please select a menu item")
            }
            
        } detail: {
            
            if let selectedItem {
                Image(systemName: selectedItem.icon)
                    .resizable()
                    .scaledToFit()
                    .padding()
            } else {
                Text("Please select an item")
            }
        }
    }
}

struct ThreeColumnSplitView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeColumnSplitView()
    }
}
