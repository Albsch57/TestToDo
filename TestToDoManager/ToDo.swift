//
//  ToDo.swift
//  TestToDoManager
//
//  Created by Alyona Bedrosova on 21.07.2023.
//

import Foundation
import UIKit

struct Task: Equatable {
    let id: Int
    let title: String
    let description: String
    let dueDate: Date?
    var isCompleted: Bool
}


class ToDoManager {
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func removeTask(withId taskId: Int) {
        tasks.removeAll { $0.id == taskId }
    }
    
    var taskCount: Int {
        tasks.count
    }
    
    var tasks: [Task] = []
    
    func filterTasks(isCompleted: Bool) -> [Task] {
            return tasks.filter { $0.isCompleted == isCompleted }
        }
}
