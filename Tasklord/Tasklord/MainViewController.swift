//
//  ViewController.swift
//  Tasklord
//
//  Created by Дмитрий on 15.11.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tasksTableView.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "TaskTableViewCell")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.tasksTableView.reloadData()
        })
        
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath)
        return cell
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! TaskTableViewCell).configure(textForCell: "Test")
    }
}

