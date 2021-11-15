//
//  TaskTableViewCell.swift
//  Tasklord
//
//  Created by Дмитрий on 15.11.2021.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet private var taskLabel: UILabel!
    
    func configure(textForCell: String) {
        self.taskLabel.text = textForCell
    }
    
}
