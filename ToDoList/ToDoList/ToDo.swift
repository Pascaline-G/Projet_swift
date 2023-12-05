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
    private var state: Bool
    
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        self.state = false
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
    public var State: Bool {
        get {
            return self.state
        }
        set(state) {
            self.state = state
        }
    }
}
