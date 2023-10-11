//
//  SampleViewModel.swift
//

import Foundation

@MainActor
final class SampleViewModel: ObservableObject {
    private let client = ApiClient()
    
    @Published var items: [ToDoItem] = []
    @Published var isProgress: Bool = false
    
    private var itemsBackup: [ToDoItem] = []
    @Published var searchText = "" {
        didSet {
            search(searchText)
        }
    }
    
    // MARK: Remote Info
    private func getToDoTasks() async {
        guard let urlData = URL(string: "https://gist.githubusercontent.com/rigovides/12708f4aed26f847a0fe34f0fef1dbd7/raw/bb5a9a21f599acb2a46d01f45709d0aeb669f965/items.json") else {
            return
        }
        
        let urlRequest = URLRequest(url: urlData)
        
        do {
            let tasks: [ToDoTask] = try await client.fetch(request: urlRequest)
            
            items.removeAll()
            tasks.forEach { task in
                items.append(ToDoItem(task: task))
            }
            
            itemsBackup = items
            print("Number of tasks: ", items.count)

        } catch {
            print("\((error as! ApiError).customDescription)")
        }
    }
    
    // MARK: Helpers
    func getTask() {
        if items.isEmpty {
            isProgress = true
        }
        
        Task {
            await getToDoTasks()
            isProgress = false
        }
    }
    
    func update(_ task: ToDoItem) {
        var updatedItems = [ToDoItem]()
        items.forEach { item in

            if task.id == item.id {
                updatedItems.append(ToDoItem(task: item.task, isDone: !item.isDone))
            } else {
                updatedItems.append(item)
            }
        }

        items = updatedItems
        itemsBackup = items
    }
    
    func delete(_ task: ToDoItem) {
        if let index = items.firstIndex(where: { $0.id == task.id}) {
            items.remove(at: index)
        }
        
        itemsBackup = items
    }
    
    private func search(_ text: String) {
        if text.isEmpty {
            items = itemsBackup
        } else {
            items = itemsBackup.filter { $0.task.title?.localizedCaseInsensitiveContains(searchText) == true}
        }
    }
}
