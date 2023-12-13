//
//  ViewController.swift
//  ToDoList
//
//  Created by Pascaline, Arnaud on 28/11/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsToDo[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return sectionsToDo.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName = ["Today", "Tomorrow", "This week", "Later"]
        return sectionName[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "todos", for: indexPath) as! ToDoTableViewCell
        let row = indexPath.row
        
        
        let todos = sectionsToDo[indexPath.section]
        todoCell.desc.text = todos[row].Description
        todoCell.name.text = todos[row].Name
        todoCell.state.isOn = todos[row].State
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let formattedDate = dateFormatter.string(from: todos[row].date)
        
        
        todoCell.dateUI.text = formattedDate
        
        return todoCell
    }
    
    @IBAction func changeStateOfATodo(_ sender: UISwitch) {
        let state = sender.isOn
        let supersuperview = sender.superview?.superview
        let tablecell = supersuperview as! UITableViewCell
        let row = self.todosTableView.indexPath(for: tablecell)!.row
        self.toDoList.get(index: row).State = state
    }
    
    @IBAction func deleteAToDo(_ sender: UIButton) {
        let supersuperview = sender.superview?.superview
        let tablecell = supersuperview as! UITableViewCell
        let row = self.todosTableView.indexPath(for: tablecell)!.row
        toDoList.remove(index: row)
        sectionsToDo = toDoList.getSections()
        self.todosTableView.reloadData()        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...10{
            let name = "TODO n°" + String(i)
            let desc = "Tache à faire n°" + String(i)
            let todo = ToDo(name: name, description: desc)
            toDoList.addToDo(todo: todo)
        }
        sectionsToDo = toDoList.getSections()
        self.todosTableView.dataSource = self
    }
    
    public func addToDo(todo: ToDo) {
        toDoList.addToDo(todo: todo)
        sectionsToDo = toDoList.getSections()
        self.todosTableView.reloadData()
    }

    private var sectionsToDo = [[ToDo]]()
    private var toDoList : ToDoList = ToDoList()
    @IBOutlet weak var todosTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewControllerDetails {
            let detailTodo = segue.destination as! ViewControllerDetails
            let selectedRow = todosTableView.indexPathForSelectedRow!.row
            let todo = self.toDoList.get(index: selectedRow)
            detailTodo.name = todo.Name
            detailTodo.desc = todo.Description
            detailTodo.state = todo.State
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let formattedDate = dateFormatter.string(from: todo.date)
            detailTodo.date = formattedDate
        }
        if segue.destination is ViewControllerAddToDo {
            let addTodoView = segue.destination as! ViewControllerAddToDo
            addTodoView.setView(originalView: self)
        }
        if segue.destination is ViewControllerCategories {
            let categoriesView = segue.destination as! ViewControllerCategories
            let categories = toDoList.getTodoByCategory()
            categoriesView.categories = categories
        }
        if segue.destination is SearchViewController {
            let searchView = segue.destination as! SearchViewController
            searchView.todoList = toDoList
        
        }
    }
    
}

