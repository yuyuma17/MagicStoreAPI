//
//  TableShopViewCell.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/8.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class TableShopViewCell: UICollectionViewCell {
    
    @IBOutlet private var magicIcon: UIImageView!
    @IBOutlet private var magicName: UILabel!
    @IBOutlet private var magicPrice: UILabel!
    @IBOutlet private var soldOutView: UIView!
    
}

extension TableShopViewCell {
    
    func setShopData(levelMode: ShopViewState.levelMode, indexPath: IndexPath) {
//        magicIcon.image = UIImage(named: ShopViewState.shopList[indexPath.row].name)
//        magicName.text = "\(ShopViewState.shopList[indexPath.row].name)"
//        magicPrice.text = ShopViewState.shopList[indexPath.row].price
    }
    
}
