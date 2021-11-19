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
    
    private var parsedDescription: PageDescriptionParsed?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let description = parsedDescription?.description {
            self.descriptionLabel.text = description
        }
    

    }
    
    
    

}
