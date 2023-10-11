//
//  ToDoCell.swift
//  SwiftUI-ToDoApp
//
//  Created by Manuel Salinas on 7/13/23.
//

import SwiftUI

struct ToDoListRow: View {
    @Binding var item: ToDoItem
    
    var body: some View {
        HStack {
            let completedTask = item.isDone
            let icon = completedTask ? "checkmark.circle.fill" : "circle"
            let color: Color = completedTask ? .indigo.opacity(0.7) : .gray

            VStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(color)
                    .padding(1)
            }
            
            VStack(alignment: .leading) {
                Text(item.task.title ?? "")
                    .fontWeight(.bold)
                    .strikethrough(completedTask)
                
                Text(item.task.details?.description ?? "")
                    .foregroundColor(.black.opacity(0.6))
                    .opacity(completedTask ? 0.5 : 1.0)
                
                Text(item.task.details?.dayStr ?? "")
                    .font(.subheadline)
                    .foregroundColor(.indigo)
                    .opacity(completedTask ? 0.5 : 1.0)
            }
            Spacer()
        }
        .onTapGesture {
            item.isDone.toggle()
        }
    }
}

struct ToDoListRow_Previews: PreviewProvider {
    static var previews: some View {
        let detail = TaskDetails(description: "more information", day: 7)
        let task = ToDoTask(title: "My Title", details: detail)
        let toDo: ToDoItem = ToDoItem(task: task, isDone: false)

        ToDoListRow(item: .constant(toDo))
    }
}


