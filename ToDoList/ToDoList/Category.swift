//
//  Category.swift
//  ToDoList
//
//  Created by esirem on 13/12/2023.
//

import Foundation

class Category {
    private var name: String
    private var todos: [ToDo]
    
    init(name: String, todos: [ToDo]) {
        self.name = name
        self.todos = todos
    }
    
    public var Name: String {
        get {
            return self.name
        }
        set(name) {
            self.name = name
        }
    }
    
    public var Todos: [ToDo] {
        get {
            return self.todos
        }
        set(todos) {
            self.todos = todos
        }
    }
    
    public func addTodo(todo: ToDo) {
        todos.append(todo)
    }
}
