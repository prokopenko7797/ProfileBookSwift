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
        
        if  Validator.isValidEmail(loginTextField.text!)
        {
        
            if passwordTextField.text == confirmPasswordTextField.text
            {
                
                if Validator.isValidPassword(passwordTextField.text!)
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
                    let alert = UIAlertController(title: "Error", message: "Password must be at least 4 and no mere than 16 and must contain at least one uppercase letter, one lowercase letter and one number.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Back", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            else
            {
                let alert = UIAlertController(title: "Error", message: "Password mismatches", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Back", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Wrong email", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Back", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func onTextChanged(_ sender: Any)
    {
        signUpButton.isEnabled = !(loginTextField.text!.isEmpty || passwordTextField.text!.isEmpty || confirmPasswordTextField.text!.isEmpty)
    }
    
}
