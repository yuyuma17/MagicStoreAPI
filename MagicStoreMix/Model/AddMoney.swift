//
//  AddMoney.swift
//  MagicStoreMix
//
//  Created by 黃士軒 on 2019/11/13.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import Foundation

struct AddMoney: Codable {
    
    let result: [returnResult]
    
}

struct returnResult: Codable {
    
    var balance: Int
    
}
