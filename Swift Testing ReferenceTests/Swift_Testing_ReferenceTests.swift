//
//  Swift_Testing_ReferenceTests.swift
//  Swift Testing ReferenceTests
//
//  Created by Lal Castro Antony on 04/02/25.
//

import Testing
@testable import Swift_Testing_Reference

struct ViewModelTests {
    
    let viewModel = TodoViewModel()

    @Test("Adding a task") func someSampleTest() throws {
        viewModel.addTodo(title: "First Task")
        let task = try #require(viewModel.todos.first, "Must have a first task")
        #expect(task.title == "First Task")
        #expect(viewModel.todos.count == 1)
    }
    
    @Test("Toggling completion", .tags(.removeTask)) func toggleCompletion() throws {
        // Arrange
        viewModel.addTodo(title: "Buy milk")
        let task = try #require(viewModel.todos.first, "Task is not avaialble")
        
        // Act
        viewModel.toggleCompletion(for: task.id)
        
        // Assert
        let milkTask = try #require(viewModel.todos.first(where: { $0.id == task.id }),
                                           "Updated task not found in the list")
        #expect(milkTask.isCompleted == true)
    }
    
    
    // Test with condition
    @Test("Removing a task", .disabled("disabling for now"), .bug("https://someJiraTicket"))
    @available(iOS 18.0, *)
    func removeTask() throws {
        // Arrange
        viewModel.addTodo(title: "Buy milk")
        let task = try #require(viewModel.todos.first, "Task is not avaialble")
        
        // Act
        viewModel.removeTodo(id: task.id)
        
        // Assert
        #expect(viewModel.todos.isEmpty)
    }
    
      
    // Tests with arguments
    @Test("Adding tasks", .tags(.create), arguments: ["Fix the environment issue", "Update timesheet"] ) func addTask(title: String) throws {
        viewModel.addTodo(title: title)
        let task = try #require(viewModel.todos.first, "Task is not avaialble")
        #expect(task.title == title)
    }
    
}
