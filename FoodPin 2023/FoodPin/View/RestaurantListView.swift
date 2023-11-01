//
//  RestaurantListView.swift
//  FoodPin
//
//  Created by Simon Ng on 14/10/2022.
//

import SwiftUI

struct RestaurantListView: View {
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(
        entity: Restaurant.entity(),
        sortDescriptors: [])
    var restaurants: FetchedResults<Restaurant>
    
    @State private var showNewRestaurant = false
    
    var body: some View {
        NavigationStack {
            List {
                if restaurants.count == 0 {
                    Image("emptydata")
                        .resizable()
                        .scaledToFit()
                } else {
                    ForEach(restaurants.indices, id: \.self) { index in
                        ZStack(alignment: .leading) {
                            NavigationLink(destination: RestaurantDetailView(restaurant: restaurants[index])) {
                                EmptyView()
                            }
                            .opacity(0)
                            
                            BasicTextImageRow(restaurant: restaurants[index])
                        }
                    }
                    .onDelete(perform: deleteRecord)
                    .listRowSeparator(.hidden)
                }
            }
            
            .listStyle(.plain)
            .navigationTitle("FoodPin")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem {
                    Button {
                        showNewRestaurant.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .accentColor(.primary)
        .sheet(isPresented: $showNewRestaurant) {
            NewRestaurantView()
        }
    }
    
    private func deleteRecord(indexSet: IndexSet) {
        
        for index in indexSet {
            let itemToDelete = restaurants[index]
            context.delete(itemToDelete)
        }

        DispatchQueue.main.async {
            do {
                try context.save()

            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    return RestaurantListView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

    return RestaurantListView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        .preferredColorScheme(.dark)
}
