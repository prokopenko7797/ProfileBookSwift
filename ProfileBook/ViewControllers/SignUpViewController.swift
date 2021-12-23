//
//  SignUpViewController.swift
//  ProfileBook
//
//  Created by User on 20.12.2021.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateUserInfo() {
        
        var result = UserService.shared.registrate("lolkek@mail.ru", "12345678")
        print(result)
        
        result = UserService.shared.autorize("lolkek@mail.ru", "12345678")
        print(result)
        
        result = UserService.shared.autorize("lolkek@maru", "12345678")
        print(result)

        
    }
    

}
