//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = SampleViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                // Here your list items and navigation links
                
                    ForEach($viewModel.items) { item in
                        ToDoListRow(item: item)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button {
                                    viewModel.delete(item.wrappedValue)
                                } label: {
                                    Image(systemName: "delete.left.fill")
                                }
                                .tint(.red)
                            }
                        
                        /*
                         .onTapGesture {
                         print("This sample updates item on ViewModel to Update main view")
                         viewModel.update(item.wrappedValue)
                         }
                         */
                    }
            }
            .navigationTitle("To Do List")
            .toolbarBackground(.blue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .listStyle(.plain)
            .toolbar {
                HStack {
                    let selectedTasks = viewModel.items.filter {$0.isDone }
                    
                    if !selectedTasks.isEmpty {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.mint)
                    }
                    
                    Text(selectedTasks.isEmpty ? "" : "\(selectedTasks.count)")
                        .bold().font(.title2)
                        .foregroundColor(.mint)
                }
                
                Button {
                    print("add")
                } label: {
                    Image(systemName: "plus")
                }
                .font(.title2)
            }
        }
        .refreshable {
            viewModel.getTask()
        }
        .searchable(text: $viewModel.searchText)
        .onAppear {
            viewModel.getTask()
        }
        
        /*
         Tip: not recommended usage of .task due to usually you need to call more async calls
        */
//        .task {
//            print("Running task before view appears")
//            await viewModel.getToDoTasks()
//        }
    }
}

#Preview {
    ContentView()
}
