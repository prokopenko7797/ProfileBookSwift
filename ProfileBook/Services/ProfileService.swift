//
//  ProfileService.swift
//  ProfileBook
//
//  Created by User on 28.12.2021.
//

import Foundation
import SQLite

class ProfileService {
    
    static let shared = ProfileService()
    
    fileprivate let passwordExp = Expression<String>("password")
    
    fileprivate let idExp = Expression<Int>("id")
    fileprivate let nickNameExp = Expression<String>("nickName")
    fileprivate let nameExp = Expression<String>("name")
    fileprivate let descriptionExp = Expression<String>("description")
    fileprivate let imagePathExp = Expression<String>("imagePath")
    fileprivate let userIdExp = Expression<Int>("userId")
    fileprivate let dateExp = Expression<String>("date")
    
    private let profiles = Table("profiles")
    
    init()
    {
        SQLManager.shared.connectDataBase()
    }
    
    private func createProfileTable() {
        do {
            try SQLManager.shared.db.run(profiles.create(ifNotExists: true) { t in
                t.column(idExp, primaryKey: .autoincrement)
                t.column(nickNameExp)
                t.column(nameExp)
                t.column(descriptionExp)
                t.column(imagePathExp)
                t.column(userIdExp)
                t.column(dateExp)
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addProfile(_ profile: ProfileModel) -> Bool {
        
        createProfileTable()
        
        var result = false
        
        do
        {
            try SQLManager.shared.db.run(profiles.insert(nickNameExp <- profile.nickName, nameExp <- profile.name, descriptionExp <- profile.description, imagePathExp <- profile.imagePath, userIdExp <- profile.userId, dateExp <- profile.date))
            
            result = true
        }
        catch
        {
            print((error.localizedDescription))
        }
        
        return result
    }
    
    func updateProfile(_ profile: ProfileModel) -> Bool {
        
        createProfileTable()
        
        var result = false
        
        do
        {
            let filter = profiles.filter(idExp == profile.id)
            
            try SQLManager.shared.db.run(filter.update( userIdExp <- profile.userId, nickNameExp <- profile.nickName, nameExp <- profile.name, descriptionExp <- profile.description, imagePathExp <- profile.imagePath, userIdExp <- profile.userId, dateExp <- profile.date))
            
            result = true
        }
        catch
        {
            print((error.localizedDescription))
        }
        
        return result
    }
    
    func getUserProfiles(_ userId: Int) -> [ProfileModel] {
        
        createProfileTable()
        
        var result = [ProfileModel]()
        
        do {
            
            for profile in try SQLManager.shared.db.prepare(profiles)
            {
                if profile[userIdExp] == userId
                {
                    result.append(ProfileModel(profile[idExp], profile[nickNameExp], profile[nameExp], profile[descriptionExp], profile[imagePathExp], profile[userIdExp], profile[dateExp]))
                }
            }
        }
        catch {
            print((error.localizedDescription))
        }
        
        return result
    }
}
