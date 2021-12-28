//
//  MainListViewController.swift
//  ProfileBook
//
//  Created by User on 27.12.2021.
//

import Foundation
import UIKit

class MainListViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: <#T##String#>), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: <#T##String#>), style: .done, target: self, action: nil)
        ]
    }
}
