//
//  PageDescriptionViewController.swift
//  Tasklord
//
//  Created by Дмитрий on 19.11.2021.
//

import UIKit

class PageDescriptionViewController: UIViewController {

    @IBOutlet private var descriptionScrollView: UIScrollView!
    @IBOutlet private var descriptionLabel: UILabel!
    private var descr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionLabel.text = self.descr
    }
    
    func configure(description: String) {
        self.descr = description
    }


}
