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
        
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "ic_settings"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(named: "ic_exit_to_app"), style: .done, target: self, action: #selector(logOut))
        ]
    }
    
    @IBAction func logOut()
    {
        UserService.shared.logOut()
        
        let loginVC: LoginNavigationController = storyboard?.instantiateViewController(withIdentifier: "LoginNavigationController") as! LoginNavigationController
        
        self.view.window?.rootViewController = loginVC
        self.view.window?.makeKeyAndVisible()
    }
}
