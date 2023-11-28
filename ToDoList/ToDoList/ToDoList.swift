//
//  ToDoList.swift
//  ToDoList
//
//  Created by esirem on 28/11/2023.
//

import Foundation

class ToDoList {
    var todos = [ToDo]()
    
    public func addToDo(todo : ToDo) {
        self.todos.append(todo)
    }
    
    public func getToDos() -> [ToDo] {
        return todos
    }
    
    public func size() -> Int {
        return todos.count
    }
    
    public func get(index: Int) -> ToDo {
        return todos[index]
    }
}
