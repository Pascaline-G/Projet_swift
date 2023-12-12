//
//  ViewController.swift
//  ToDoList
//
//  Created by Pascaline, Arnaud on 28/11/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.size()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "todos", for: indexPath) as! ToDoTableViewCell
        let row = indexPath.row
        
        toDoList.sortByDate()
        let todos = toDoList.getToDos()
        todoCell.desc.text = todos[row].Description
        todoCell.name.text = todos[row].Name
        todoCell.state.isOn = todos[row].State
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
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
        
        self.todosTableView.dataSource = self
    }
    
    public func addToDo(todo: ToDo) {
        toDoList.addToDo(todo: todo)
        self.todosTableView.reloadData()
    }

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
        }
        if segue.destination is ViewControllerAddToDo {
            let addTodoView = segue.destination as! ViewControllerAddToDo
            addTodoView.setView(originalView: self)
        }
    }
}

