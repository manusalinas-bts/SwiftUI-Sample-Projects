//
//  ToDoTask.swift
//  TO-DO-LIST
//
//  Created by Manuel Salinas on 7/11/23.
//

import SwiftUI

struct ToDoTask: Codable {
    var title: String?
    var details: TaskDetails?
}

struct ToDoItem: Identifiable {
    let id = UUID()
    let task: ToDoTask
    var isDone: Bool
    
    init(task: ToDoTask, isDone: Bool = false) {
        self.task = task
        self.isDone = isDone
    }
}
