//
//  ViewControllerCategories.swift
//  ToDoList
//
//  Created by Pascaline, Arnaud on 12/12/2023.
//

import UIKit

class ViewControllerCategories: UIViewController, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories[section].Todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "todosCategory", for: indexPath) as! CategoryTableViewCell
        
        
        let todo = categories[indexPath.section].Todos[indexPath.row]
        
        todoCell.todoName.text = todo.Name
        return todoCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section].Name
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableViewCategory.dataSource = self
        
    }
    


    @IBOutlet weak var tableViewCategory: UITableView!
    var categories = [Category]()
}
