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
    
    var profile = ProfileModel()
    
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_save"), style: .done, target: self, action: #selector(saveProfile))
    }
    
    @IBAction func saveProfile()
    {
        profile.userId = UserDefaults.standard.integer(forKey: "userId")
        profile.nickName = nickNameTextField.text!
        profile.name = nameTextField.text!
        profile.description = descriptionTextView.text
        profile.date = Date.now
        
        if profile.userId == -1
            ? ProfileService.shared.addProfile(profile)
            : ProfileService.shared.updateProfile(profile)
        {
            NotificationCenter.default.post(name: Notification.Name("save"), object: true)
            
            navigationController?.popToRootViewController(animated: true)
        }
        
        
    }
    
    
    @IBAction func imageTapAction(_ sender: Any)
    {
        ImagePickerManager().pickImage(self){ image in
            self.imageButton.setBackgroundImage(image, for: .normal)
            self.profile.imagePath = ImageFileHelper().save(image: image)!
        }
    }
}
