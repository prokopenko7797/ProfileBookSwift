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
        var result = false
        
        if  Validator.isValidEmail(loginTextField.text!)
        {
        
            result = UserService.shared.autorize(loginTextField.text!, passwordTextField.text!)
            print(result)
            
            if result
            {
                performSegue(withIdentifier: "ToMainList", sender: nil)
            }
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Wrong email", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Back", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        print(result)
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
