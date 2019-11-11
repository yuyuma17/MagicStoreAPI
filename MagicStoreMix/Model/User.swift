//
//  User.swift
//  MagicStoreMix
//
//  Created by Jes Yang on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import Foundation

struct User: Codable {
    private(set) var name: String
    private(set) var totalMoney: Int
    private(set) var purchased: Set<Int>
    
    func getMoney() -> Int {
        return self.totalMoney
    }
    
    func getPurchased(book: MagicBook) -> Bool {
        return purchased.contains(book.id)
    }
    
    mutating func addMoney() {
        totalMoney += 100
    }
    
    mutating func purchase(book: MagicBook) {
        if totalMoney >= book.price && !purchased.contains(book.id) {
            totalMoney -= book.price
            purchased.insert(book.id)
        }
    }
    
    mutating func sell(book: MagicBook) {

        if  purchased.contains(book.id) {

            totalMoney += book.price
            purchased.remove(book.id)
        }
    }
}


class UserPersist {
        
    static let shared = UserPersist()
    
    var user: User = loadData() ?? User(name: "超級 iOS 協作隊", totalMoney: 2000, purchased: Set<Int>()) {
        didSet {
            saveData(user: self.user)
        }
    }
    
    private init() {
        print("Singleton initialized")
    }
    
    private func saveData(user: User) {

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

