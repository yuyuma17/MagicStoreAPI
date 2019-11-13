//
//  Login.swift
//  MagicStoreMix
//
//  Created by 黃士軒 on 2019/11/12.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import Foundation

struct LoginData: Codable {
    
    let name: String
    let password: String
    
}

struct LoginResult: Codable {
    
    var name: String
    var balance: Int

}


struct RegisterData: Codable {
    
    let name: String
    let password: String
    let role = 0
    
}

struct RegisterInfor: Codable {
    
    let name: String
    let balance: Int
    
}

struct RegisterResult: Codable {
    
//    let result: String
    let user: [RegisterInfor]
    
}


