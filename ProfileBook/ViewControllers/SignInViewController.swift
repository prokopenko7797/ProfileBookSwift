//
//  SignInViewController.swift
//  ProfileBook
//
//  Created by User on 20.12.2021.
//

import Foundation
import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(onGetNotification(_:)), name: Notification.Name("login"), object: nil)
    }
    
    @IBAction func signInButtonTapped(_ sender: Any)
    {
        
    }
    
    @objc func onGetNotification(_ notification: Notification)
    {
        let text = notification.object as! String?
        loginTextField.text = text
    }
    
    @IBAction func onTextChanged(_ sender: Any)
    {
        signInButton.isEnabled = !(loginTextField.text!.isEmpty || passwordTextField.text!.isEmpty)
    }

}
