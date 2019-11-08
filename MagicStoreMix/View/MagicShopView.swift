//
//  MagicShopView.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/7.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class MagicShopView: UIView {
    
//    private weak var mc: MagicShopViewController?
    
    @IBOutlet private var changeStateButton: [UIButton]!
    @IBOutlet private var moneyView: UIView!
    @IBOutlet private var userMoney: UILabel!
    @IBOutlet private var magicShopCollectionView: UICollectionView!
}

extension MagicShopView {

    func setDefaultProperties() {
        for button in changeStateButton {
            button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            setViewBorder(view: button, configSetting: .viewBorder)
        }
        setViewBorder(view: moneyView, configSetting: .viewBorder)
        setViewBorder(view: magicShopCollectionView, configSetting: .viewBorder)
        
    }
//    func setting(mc: MagicShopViewController) {
//        self.mc = mc
//    }

}
