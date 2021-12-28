//
//  AddEditProfileViewController.swift
//  ProfileBook
//
//  Created by User on 28.12.2021.
//

import Foundation
import UIKit

class AddEditProfileViewController: UIViewController
{
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_save"), style: .done, target: self, action: #selector(saveProfile))
    }
    
    @IBAction func saveProfile()
    {
        NotificationCenter.default.post(name: Notification.Name("save"), object: true)
        
        navigationController?.popToRootViewController(animated: true)
    }
}
