//
//  ViewController.swift
//  Tasklord
//
//  Created by Дмитрий on 15.11.2021.
//

import UIKit
import Fuzi

class MainViewController: UIViewController {

    @IBOutlet private var tasksTableView: UITableView!
    
    //service for getting a list of pages + model
    private var PagesService = TildaPagesListAPI()
    private var pages:[Page] = []
    
    //service for a page description
    private var PageDescription = TildaPagesDescriptionAPI()
    private var pageDescription: PageDescription?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tasksTableView.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "TaskTableViewCell")
        self.getData()
        
    }
    
    func getData() {
        
        self.PagesService.getPosts(completion: { [weak self] pages in
            guard let self = self else { return }
            self.pages = pages
            //            debugPrint(self.pages[0].descr)
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.PageDescription.getPosts(pageId: self.pages[indexPath.row].id, completion: { description in
                    
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                let storyboard = UIStoryboard(name: "PageDescription", bundle: nil)
                guard let vc = storyboard.instantiateInitialViewController() as? PageDescriptionViewController else { return }
                vc.configure(description: description)
//                let vc = storyboard.instantiateInitialViewController()
//                guard let vc = vc else { return }
                self.navigationController?.pushViewController(vc, animated: true)

//                debugPrint(description)
            })

        })
        
//        debugPrint("Row \(indexPath.row) is selected")
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? TaskTableViewCell)?.configure(textForCell: self.pages[indexPath.row].title)
    }
}

