//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by esirem on 28/11/2023.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
}
