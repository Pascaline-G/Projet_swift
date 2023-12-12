//
//  ViewControllerAddToDo.swift
//  ToDoList
//
//  Created by Pascaline, Arnaud on 05/12/2023.
//

import UIKit

class ViewControllerAddToDo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var labelName: UITextField!
    @IBOutlet weak var labelDesc: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    private var originalView: ViewController!
    
    public func setView(originalView : ViewController) {
        self.originalView = originalView
    }

    @IBAction func createTodo(_ sender: Any) {
        let date = datePicker.date
        let todo = ToDo(name: labelName.text!, description: labelDesc.text!)
        todo.date = date
        originalView.addToDo(todo: todo)
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func CancelCreationToDo(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
