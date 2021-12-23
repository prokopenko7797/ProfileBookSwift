//
//  RepositoryService.swift
//  ProfileBook
//
//  Created by User on 22.12.2021.
//

import Foundation
import SQLite

class SQLManager {
    
    static let shared = SQLManager()
    
    open private(set) var db: Connection!
    
    func connectDataBase() {
        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                             .userDomainMask,
                                                             true).first else {
            return
        }
        
        do {
            db = try Connection("\(path)/db.sqlite3")
            db.busyTimeout = 5
            db.busyHandler { tries in
                tries < 3
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
