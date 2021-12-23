//
//  UsersService.swift
//  ProfileBook
//
//  Created by User on 22.12.2021.
//

import Foundation
import SQLite

class UserService {
    
    static let shared = UserService()
    
    let users = Table("users")
    
    fileprivate let idExp = Expression<Int>("index")
    fileprivate let emailExp = Expression<String>("email")
    fileprivate let passwordExp = Expression<String>("password")
    
    init()
    {
        SQLManager.shared.connectDataBase()
    }
    
    func createUserTable() {
        do {
            try SQLManager.shared.db.run(users.create(ifNotExists: true) { t in
                t.column(idExp, primaryKey: .autoincrement)
                t.column(emailExp, unique: true)
                t.column(passwordExp)
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func registrate(_ email: String, _ password: String) -> Bool {
        
        createUserTable()
        
        var result = false
        
        do {
            var isUserAlreadyExist = false;
            
            for user in try SQLManager.shared.db.prepare(users)
            {
                if user[emailExp] == email
                {
                    isUserAlreadyExist = true
                }
            }
            
            if !isUserAlreadyExist
            {
                try SQLManager.shared.db.run(users.insert(emailExp <- email, passwordExp <- password))
                
                result = true
            }
        }
        catch {
            print((error.localizedDescription))
        }
        
        return result
    }
    
    func autorize(_ email: String, _ password: String) -> Bool {
        
        createUserTable()
        
        var result = false
        
        do {
            
            for user in try SQLManager.shared.db.prepare(users)
            {
                if user[emailExp] == email && user[passwordExp] == password
                {
                    result = true
                }
            }
        }
        catch {
            print((error.localizedDescription))
        }
        
        return result
    }
}
