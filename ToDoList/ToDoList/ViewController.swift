//
//  ViewController.swift
//  ToDoList
//
//  Created by esirem on 28/11/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.size()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "todos", for: indexPath) as! ToDoTableViewCell
        let row = indexPath.row
        
        let todos = toDoList.getToDos()
        todoCell.desc.text = todos[row].Description
        todoCell.name.text = todos[row].Name
        return todoCell
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

    private var toDoList : ToDoList = ToDoList()
    @IBOutlet weak var todosTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailTodo = segue.destination as! ViewControllerDetails
        let selectedRow = todosTableView.indexPathForSelectedRow!.row
        let todo = self.toDoList.get(index: selectedRow)
        detailTodo.name = todo.Name
        detailTodo.desc = todo.Description
        
    }
}

