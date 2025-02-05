//
//  WithoutSuite.swift
//  Swift Testing ReferenceTests
//
//  Created by Lal Castro Antony on 05/02/25.
//

import Testing
@testable import Swift_Testing_Reference


@Test("Adding a task") func someSampleTest() throws {
    let viewModel = TodoViewModel()
    viewModel.addTodo(title: "First Task")
    let task = try #require(viewModel.todos.first, "Must have a first task")
    #expect(task.title == "First Task")
    #expect(viewModel.todos.count == 1)
}

