//
//  SearchViewController.swift
//  ToDoList
//
//  Created by esirem on 13/12/2023.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTodo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "todos", for: indexPath) as! ToDoTableViewCell
        let row = indexPath.row
        
        
        let todos = filteredTodo
        todoCell.desc.text = todos[row].Description
        todoCell.name.text = todos[row].Name
        todoCell.state.isOn = todos[row].State
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let formattedDate = dateFormatter.string(from: todos[row].date)
        
        
        todoCell.dateUI.text = formattedDate
        
        return todoCell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        filteredTodo = todoList.getToDos()
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    var todoList = ToDoList()
    private var filteredTodo = [ToDo]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filteredTodo = searchText.isEmpty ? todoList.getToDos() : todoList.getToDos().filter
        { (item: ToDo) -> Bool in
            return item.Name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        tableView.reloadData()
    }

}
