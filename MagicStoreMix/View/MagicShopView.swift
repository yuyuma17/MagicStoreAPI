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
            button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            setViewBorder(view: button, configSetting: .viewBorder)
            
        }
        setViewBorder(view: self, configSetting: .mainViewBorder)
        setViewBorder(view: moneyView, configSetting: .viewBorder)
        setViewBorder(view: magicShopCollectionView, configSetting: .viewBorder)
    }
    
    func setUserMoney() {
//        userMoney.text = "\(UserPersist.loadData()!.totalMoney)"
    }
    
//    func setting(mc: MagicShopViewController) {
//        self.mc = mc
//    }
    

}
