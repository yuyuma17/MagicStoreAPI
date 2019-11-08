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
    
    func setShopData(levelMode: ShopViewState.levelMode, indexPath: IndexPath) {
//        magicIcon.image = UIImage(named: ShopViewState.shopList[indexPath.row].name)
    }
    
}
