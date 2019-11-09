//
//  PurchaseView.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/9.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class PurchaseView: UIView {

    private weak var mv: MagicShopView?
    
    @IBOutlet var magicIcon: UIImageView!
    @IBOutlet var magicPrice: UILabel!
    @IBOutlet var dicisionButton: [UIButton]! {
        didSet {
            for button in dicisionButton {
                setViewBorder(view: button, configSetting: .purchaseButton)
            }
        }
    }
    
    @IBAction func tapToPurchase(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    @IBAction func tapToCancelPurchase(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
}

extension PurchaseView {
    
    func setData(shopMode:ShopViewState.shopMode, levelMode: ShopViewState.levelMode, indexPath: IndexPath) {
        let shopList = ShopViewState(shopMode: shopMode, levelMode: levelMode).shopList
        magicIcon.image = UIImage(named: "\(shopList[indexPath.row].name)")
        magicPrice.text = "$ \(shopList[indexPath.row].price)"
    }
    
}
