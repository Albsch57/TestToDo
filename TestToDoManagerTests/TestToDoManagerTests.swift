//
//  TestToDoManagerTests.swift
//  TestToDoManagerTests
//
//  Created by Alyona Bedrosova on 21.07.2023.
//

import XCTest
@testable import TestToDoManager

final class TestToDoManagerTests: XCTestCase {
    
    var toDoManager: ToDoManager!
    
    override func setUpWithError() throws {
        toDoManager = ToDoManager()
        try super.setUpWithError()
        
    }
    
    override func tearDownWithError() throws {
        toDoManager = nil
        try super.tearDownWithError()
    }
    
    
    //    addTask(_ task: Task): Проверьте, что метод корректно добавляет задачу в список задач и что список задач действительно увеличивается на 1 после добавления. Проверьте также, что добавленная задача присутствует в списке и имеет правильные значения свойств.
    func testAddTask() throws {
        let task = Task(id: 1, title: "Task 1", description: "Description 1", dueDate: nil, isCompleted: false)
        toDoManager.addTask(task)
        
        XCTAssertEqual(toDoManager.taskCount, 1)
        XCTAssertEqual(toDoManager.tasks.first?.title, "Task 1")
    }
    
    //    removeTask(withID taskID: Int): Проверьте, что метод корректно удаляет задачу из списка задач, и что список задач действительно уменьшается на 1 после удаления. Проверьте также, что удаленная задача больше не присутствует в списке.
    
    func testRemoveTask() throws {
        let task1 = Task(id: 1, title: "Task 1", description: "Description 1", dueDate: nil, isCompleted: false)
        let task2 = Task(id: 2, title: "Task 2", description: "Description 2", dueDate: nil, isCompleted: false)
        toDoManager.addTask(task1)
        toDoManager.addTask(task2)
        
        toDoManager.removeTask(withId: 1)
        
        XCTAssertEqual(toDoManager.taskCount, 1)
        XCTAssertEqual(toDoManager.tasks.first?.id, 2)
    }
    
    // taskCount: Int: Проверьте, что вычисляемое свойство taskCount возвращает правильное количество задач в списке. Проверьте, что оно равно 0, когда список задач пуст, и увеличивается правильно после добавления и уменьшается после удаления задач.
    
    func testTaskCount() throws {
        XCTAssertEqual(toDoManager.taskCount, 0)
        
        let task = Task(id: 1, title: "Task 1", description: "Description 1", dueDate: nil, isCompleted: false)
        toDoManager.addTask(task)
        
        XCTAssertEqual(toDoManager.taskCount, 1)
        
        toDoManager.removeTask(withId: 1)
        XCTAssertEqual(toDoManager.taskCount, 0)
    }
    
    //tasks: [Task]: Проверьте, что свойство tasks действительно возвращает массив всех задач в списке. Проверьте, что массив пуст, когда список задач пуст, и содержит все добавленные задачи.
    
    func testTasks() throws {
        
        XCTAssertTrue(toDoManager.tasks.isEmpty)
        
        let task1 = Task(id: 1, title: "Task 1", description: "Description 1", dueDate: nil, isCompleted: false)
        let task2 = Task(id: 2, title: "Task 2", description: "Description 2", dueDate: nil, isCompleted: false)
        toDoManager.addTask(task1)
        toDoManager.addTask(task2)
        
        XCTAssertEqual(toDoManager.tasks, [task1, task2])
    }
    
    
    //    1Фильтрация задач: Добавьте методы для фильтрации задач по различным критериям, таким как выполненные задачи, невыполненные задачи, задачи с определенными датами выполнения и т. д. Напишите Unit Test для проверки правильности фильтрации задач.
    
    func testFilterTasks() {
        let task1 = Task(id: 1, title: "Task 1", description: "Description 1", dueDate: nil, isCompleted: false)
        let task2 = Task(id: 2, title: "Task 2", description: "Description 2", dueDate: nil, isCompleted: true)
        let task3 = Task(id: 3, title: "Task 3", description: "Description 3", dueDate: Date(), isCompleted: false)
        toDoManager.addTask(task1)
        toDoManager.addTask(task2)
        toDoManager.addTask(task3)
        
        let completedTasks = toDoManager.tasks.filter { $0.isCompleted }
        XCTAssertEqual(completedTasks.count, 1)
        
        let uncompletedTasks = toDoManager.tasks.filter { !$0.isCompleted }
        XCTAssertEqual(uncompletedTasks.count, 2)
        
        let tasksWithDueDate = toDoManager.tasks.filter { $0.dueDate != nil }
        XCTAssertEqual(tasksWithDueDate.count, 1)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
