//
//  DetailsViewController.swift
//  EventProjectTest
//
//  Created by Liz Mabel Gomes on 05/05/23.
//

import UIKit

class DetailsViewController: UIViewController {
    var viewDetails = DetailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = viewDetails
        
        viewDetails.topAnchor.constraint (equalTo: view.topAnchor).isActive = true
        viewDetails.leadingAnchor.constraint (equalTo: view.leadingAnchor).isActive = true
        viewDetails.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewDetails.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    }
}
