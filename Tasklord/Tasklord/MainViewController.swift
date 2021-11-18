//
//  ViewController.swift
//  Tasklord
//
//  Created by Дмитрий on 15.11.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private var tasksTableView: UITableView!
    
    private var PagesService = TildaPagesListAPI()
    private var pages:[Page] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tasksTableView.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "TaskTableViewCell")
        self.getData()
        
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.PagesService.getPosts(completion: { [weak self] pages in
                guard let self = self else { return }
                self.pages = pages
                //            debugPrint(self.pages[0].descr)
                
            })
            
            
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
            self.tasksTableView.reloadData()

        })
        
    }
    
    @IBAction func refreshButtonPushed(_ sender: Any) {
        self.getData()
        
        
    }
    
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        debugPrint(self.pages.count)
        return self.pages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath)
        return cell
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? TaskTableViewCell)?.configure(textForCell: self.pages[indexPath.row].title)
    }
}

