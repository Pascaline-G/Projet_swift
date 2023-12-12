//
//  ToDo.swift
//  ToDoList
//
//  Created by Pascaline, Arnaud on 28/11/2023.
//

import Foundation

class ToDo {
    private var name: String
    private var description: String
    private var state: Bool
    private var _date: Date
    private var category : String
    
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        self.state = false
        self._date = Date()
        self.category = ""
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
    
    public var date: Date {
        get {
            return self._date
        }
        set(date) {
            self._date = date
        }
    }
    
    public var Categories: String {
        get {
            return self.category
        }
        set(category) {
            self.category = category
        }
    }
}
