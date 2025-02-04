//
//  TodoViewModel.swift
//  Swift Testing Reference
//
//  Created by Lal Castro on 04/02/25.
//


import Foundation

class TodoViewModel: ObservableObject {
    @Published private(set) var todos: [Todo] = []

    func addTodo(title: String) {
        let newTodo = Todo(title: title)
        todos.append(newTodo)
    }

    func toggleCompletion(for id: UUID) {
        if let index = todos.firstIndex(where: { $0.id == id }) {
            todos[index].isCompleted.toggle()
        }
    }

    func removeTodo(id: UUID) {
        todos.removeAll { $0.id == id }
    }

    func clearCompletedTodos() {
        todos.removeAll { $0.isCompleted }
    }
}
