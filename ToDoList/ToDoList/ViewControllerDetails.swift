//
//  ViewControllerDetails.swift
//  ToDoList
//
//  Created by Pascaline, Arnaud on 28/11/2023.
//

import UIKit

class ViewControllerDetails: UIViewController {
    var name : String = ""
    var desc : String = ""
    var state : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameDetails.text = name
        descDetails.text = desc
        stateDetails.isOn = state
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameDetails: UILabel!
    @IBOutlet weak var stateDetails: UISwitch!
    @IBOutlet weak var descDetails: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
