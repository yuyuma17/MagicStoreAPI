//
//  User.swift
//  MagicStoreMix
//
//  Created by Jes Yang on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import Foundation

struct User: Codable {
    var name: String
    var totalMoney: Int
    var purchased: [MagicBook]
}

class UserData {
    var user = User(name: "Jes", totalMoney: 2000, purchased: [MagicBook]())
}

class UserPersist {
        
    static func saveData(user: User) {
        // Use PropertyListEncoder to convert Player into Data / NSData
        do {
            let userData = try PropertyListEncoder().encode(user)
            UserDefaults.standard.set(userData, forKey: "userKey")
        } catch {
            print("Save data error.")
        }
    }
    
    static func loadData() -> User? {
        guard let userData = UserDefaults.standard.object(forKey: "userKey") as? Data else {
            return nil
        }
        
        // Use PropertyListDecoder to convert Data into Player
        guard let user = (try? PropertyListDecoder().decode(User.self, from: userData)) else {
            print("Load data error.")
            return nil
        }
        
        return user
    }
}
