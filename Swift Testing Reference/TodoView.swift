//
//  ContentView.swift
//  Swift Testing Reference
//
//  Created by Lal Castro Antony on 04/02/25.
//

import SwiftUI

struct TodoView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var newTodoTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter new task", text: $newTodoTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading)

                    Button(action: {
                        guard !newTodoTitle.isEmpty else { return }
                        viewModel.addTodo(title: newTodoTitle)
                        newTodoTitle = ""
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing)
                }
                .padding()

                List {
                    ForEach(viewModel.todos) { todo in
                        HStack {
                            Button(action: {
                                viewModel.toggleCompletion(for: todo.id)
                            }) {
                                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(todo.isCompleted ? .green : .gray)
                            }
                            .buttonStyle(BorderlessButtonStyle())

                            Text(todo.title)
                                .strikethrough(todo.isCompleted, color: .gray)
                                .foregroundColor(todo.isCompleted ? .gray : .primary)

                            Spacer()

                            Button(action: {
                                viewModel.removeTodo(id: todo.id)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }

                if viewModel.todos.contains(where: { $0.isCompleted }) {
                    Button("Clear Completed") {
                        viewModel.clearCompletedTodos()
                    }
                    .foregroundColor(.red)
                    .padding()
                }
            }
            .navigationTitle("To-Do List")
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}

struct Todo: Identifiable, Equatable {
    let id: UUID
    var title: String
    var isCompleted: Bool

    init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}


