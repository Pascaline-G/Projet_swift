//
//  ToDoList.swift
//  ToDoList
//
//  Created by Pascaline, Arnaud on 28/11/2023.
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
    
    public func remove(index: Int) {
        todos.remove(at: index)
    }
    
    public func sortByDate() {        
        todos.sort(by: { todo1, todo2 in
            todo1.date < todo2.date
        })
    }
    
    public func getSections() -> [[ToDo]] {
        var res = [[ToDo]]()
        for i in 0...3 {
            res.append(getSectionbyDate(section: i))
        }
        return res
    }
    
    public func getSectionbyDate(section: Int) -> [ToDo] {
        var res = [ToDo]()
        var comparator: (Date)->Bool
        switch section {
        case 0:
            comparator = {
                (date: Date)->Bool in return Calendar.current.isDateInToday(date)
            }
        case 1:
            comparator = {
                (date: Date)->Bool in return Calendar.current.isDateInTomorrow(date)
            }
        case 2:
            var dateComponentWeek = DateComponents()
            dateComponentWeek.day = 7
            var dateComponentTom = DateComponents()
            dateComponentTom.day = 1
            comparator = {
                (date: Date)->Bool in return (Calendar.current.date(byAdding: dateComponentWeek, to: Date())! > date) && (Calendar.current.date(byAdding: dateComponentTom, to: Date())! < date)
            }
        default:
            var dateComponentWeek = DateComponents()
            dateComponentWeek.day = 7
            comparator = {
                (date: Date)->Bool in return Calendar.current.date(byAdding: dateComponentWeek, to: Date())! < date
            }
        }
        for todo in todos {
            if(comparator(todo.date)) {
                res.append(todo)
            }
        }
        return res
    }
}
