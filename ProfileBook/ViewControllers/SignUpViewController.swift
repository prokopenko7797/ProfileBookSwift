//
//  SignUpViewController.swift
//  ProfileBook
//
//  Created by User on 20.12.2021.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateUserInfo() {
        
        if loginTextField.text != nil || (passwordTextField.text != nil) || (confirmPasswordTextField.text != nil)
        {
            let result = UserService.shared.registrate(loginTextField.text!, passwordTextField.text!)
            print(result)
            
            if result
            {
                NotificationCenter.default.post(name: Notification.Name("login"), object: loginTextField.text)
                
                navigationController?.popToRootViewController(animated: true)
            }
        }
        else
        {
            let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func onTextChanged(_ sender: Any)
    {
        if loginTextField.text!.isEmpty || passwordTextField.text!.isEmpty || confirmPasswordTextField.text!.isEmpty
        {
            signUpButton.isEnabled = false;
        }
        else
        {
            signUpButton.isEnabled = true
        }
    }
    
}
