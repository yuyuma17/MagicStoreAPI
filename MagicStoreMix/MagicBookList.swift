//
//  MagicBookList.swift
//  MagicStoreMix
//
//  Created by Jes Yang on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import Foundation

struct MagicBook: Codable {
    let id: String
    let name: String
    let level: Int
    let price: Int
}

class MagicBookList {
    
    private let bookLists: [MagicBook] = [
        MagicBook(id: "Shield", name: "保護罩", level: 1, price: 100),
        MagicBook(id: "EnergyBolt", name: "光箭", level: 1, price: 100),
        MagicBook(id: "IceDagger", name: "冰箭", level: 1, price: 100),
        MagicBook(id: "LesserHeal", name: "初級治癒術", level: 1, price: 100),
        MagicBook(id: "Teleport", name: "指定傳送", level: 1, price: 100),
        MagicBook(id: "Light", name: "日光術", level: 1, price: 100),
        MagicBook(id: "HolyWeapon", name: "神聖武器", level: 1, price: 100),
        MagicBook(id: "WindShuriken", name: "風刃", level: 1, price: 100),
        MagicBook(id: "Stalac", name: "地獄之牙", level: 2, price: 300),
        MagicBook(id: "ChillTouch", name: "寒冷戰慄", level: 2, price: 300),
        MagicBook(id: "EnchantWeapon", name: "擬似魔法武器", level: 2, price: 300),
        MagicBook(id: "CursePoison", name: "毒咒", level: 2, price: 300),
        MagicBook(id: "FireArrow", name: "無所遁形術", level: 2, price: 300),
        MagicBook(id: "Detection", name: "火箭", level: 2, price: 300),
        MagicBook(id: "CurePoison", name: "解毒術", level: 2, price: 300),
        MagicBook(id: "DecreaseWeight", name: "負重強化", level: 2, price: 300),
        MagicBook(id: "Heal", name: "中級治癒術", level: 3, price: 500),
        MagicBook(id: "FrozenCloud", name: "極光雷電", level: 3, price: 500),
        MagicBook(id: "Lightning", name: "能量感測", level: 3, price: 500),
        MagicBook(id: "RevealElemental", name: "初級治癒術", level: 3, price: 500),
        MagicBook(id: "TurnUndead", name: "起死回生術", level: 3, price: 500),
        MagicBook(id: "BlessedArmor", name: "鎧甲護持", level: 3, price: 500),
        MagicBook(id: "CurseBlind", name: "闇盲咒術", level: 3, price: 500)
    ]
    
    var level1: [MagicBook] {
        return bookLists.filter {($0.level == 1)}
    }
    
    var level2: [MagicBook] {
        return bookLists.filter {($0.level == 2)}
    }
    
    var level3: [MagicBook] {
        return bookLists.filter {($0.level == 3)}
    }
    
}
