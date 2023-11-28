//
//  ToDo.swift
//  ToDoList
//
//  Created by esirem on 28/11/2023.
//

import Foundation

class ToDo {
    private var name: String
    private var description: String
    
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    public var Description: String {
        get {
            return self.description
        }
        set(description) {
            self.description = description
        }
    }
    
    public var Name: String {
        get {
            return self.name
        }
        set(name) {
            self.name = name
        }
    }
}
