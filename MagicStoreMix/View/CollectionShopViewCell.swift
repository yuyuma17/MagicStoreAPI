//
//  CollectionShopViewCell.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/8.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class CollectionShopViewCell: UICollectionViewCell {
    
    @IBOutlet private var magicIcon: UIImageView!
    @IBOutlet private var soldOutView: UIView!
    
}

extension CollectionShopViewCell {
    
    func setShopData(shopMode: ShopViewState.shopMode, levelMode: ShopViewState.levelMode, indexPath: IndexPath) {
        let shopList = ShopViewState(shopMode: shopMode, levelMode: levelMode).shopList
        magicIcon.image = UIImage(named: shopList[indexPath.row].name)
    }
    
}
