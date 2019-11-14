//
//  LoginAndRegister.swift
//  MagicStoreMix
//
//  Created by 黃士軒 on 2019/11/12.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import Foundation

struct ShouldPassLoginData: Codable {
    
    let name: String
    let password: String
    
}

struct ShouldPassRegisterData: Codable {
    
    let name: String
    let password: String
    let role = 0
    
}

struct ShouldReceiveInformation: Codable {
    
    let name: String
    let balance: Int
    
}

struct ReceiveLoginResult: Codable {
    
    let user: ShouldReceiveInformation

}

struct ReceiveRegisterResult: Codable {
    
    let user: ShouldReceiveInformation
    
}


