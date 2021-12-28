//
//  Profile.swift
//  ProfileBook
//
//  Created by User on 20.12.2021.
//

import Foundation

struct ProfileModel {
    var id: Int = -1
    var nickName: String
    var name: String
    var description: String
    var imagePath: String
    var userId: Int
    var date: Date
    
    init(_ id: Int, _ nickName: String, _ name: String, _ description: String, _ imagePath: String, _ userId: Int, _ date: Date){
     
        self.id = id
        self.nickName = nickName
        self.name = name
        self.description = description
        self.imagePath = imagePath
        self.userId = userId
        self.date = date
    }
}
