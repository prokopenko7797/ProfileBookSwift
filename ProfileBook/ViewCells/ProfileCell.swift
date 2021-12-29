//
//  ProfileCell.swift
//  ProfileBook
//
//  Created by User on 29.12.2021.
//

import Foundation
import UIKit

class ProfileCell : UITableViewCell
{
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var imageButton: UIButton!
    
    func setProfile(profile: ProfileModel)
    {
        let image = ImageFileHelper().load(fileName: profile.imagePath)
        if image != nil
        {
            imageButton.setBackgroundImage(image, for: .normal)
        }
        nickNameLabel.text = profile.nickName
        nameLabel.text = profile.name
        dateLabel.text = profile.date
    }
}
