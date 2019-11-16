//
//  MagicBook.swift
//  MagicStoreMix
//
//  Created by 黃士軒 on 2019/11/12.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import Foundation

struct AllMagicBookItems: Codable {
    
    let magics: [MagicInformation]
    
    struct MagicInformation: Codable {
        
        let id: Int
        let name: String
        let price: String
        let level: Int
        let magic_id: Int?
        
    }
}

class AllMagicBooks {
    
    static let shared = AllMagicBooks()
    
    var allMagicBooks: [AllMagicBookItems.MagicInformation]?
    
    var level1: [AllMagicBookItems.MagicInformation] {
        return allMagicBooks!.filter {($0.level == 1)}
    }
    
    var level2: [AllMagicBookItems.MagicInformation] {
        return allMagicBooks!.filter {($0.level == 2)}
    }
    
    var level3: [AllMagicBookItems.MagicInformation] {
        return allMagicBooks!.filter {($0.level == 3)}
    }
    
    private init() {}
}
