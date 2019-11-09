//
//  MagicShopView.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/7.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class MagicShopView: UIView {
    
    private weak var vc: MagicShopViewController?
    
    @IBOutlet private var changeStateButton: [UIButton]!
    @IBOutlet private var moneyView: UIView!
    @IBOutlet private var userMoney: UILabel!
    @IBOutlet private var magicShopCollectionView: UICollectionView!
    
    @IBAction private func tapToSwitchLevel1(_ sender: UIButton) {
        vc?.levelMode = .level1
        magicShopCollectionView.reloadData()
    }
    @IBAction private func tapToSwitchLevel2(_ sender: UIButton) {
        vc?.levelMode = .level2
        magicShopCollectionView.reloadData()
    }
    @IBAction private func tapToSwitchLevel3(_ sender: UIButton) {
        vc?.levelMode = .level3
        magicShopCollectionView.reloadData()
    }
    @IBAction private func tapToSwitchTable(_ sender: UIButton) {
        vc?.shopMode = .table
        magicShopCollectionView.reloadData()
    }
    @IBAction private func tapToSwitchCollection(_ sender: UIButton) {
        vc?.shopMode = .collection
        magicShopCollectionView.reloadData()
    }
    
}

extension MagicShopView {
    
    func perpare(vc: MagicShopViewController) {
        self.vc = vc
    }
    
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
        userMoney.text = "$ \(UserPersist.shared.user.totalMoney)"
    }

}
