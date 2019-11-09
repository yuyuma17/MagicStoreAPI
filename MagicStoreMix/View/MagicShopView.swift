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
    private let screenBounds:CGRect = UIScreen.main.bounds
    private let userPersist = UserPersist.shared
    
    @IBOutlet private var changeStateButton: [UIButton]! {
        didSet {
            for button in changeStateButton {
                button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                setViewBorder(view: button, configSetting: .viewBorder)
            }
        }
    }
    @IBOutlet private var moneyView: UIView! {
        didSet {
            setViewBorder(view: moneyView, configSetting: .viewBorder)
        }
    }
    @IBOutlet private var userMoney: UILabel!
    @IBOutlet private var magicShopCollectionView: UICollectionView! {
        didSet {
            setViewBorder(view: magicShopCollectionView, configSetting: .viewBorder)
        }
    }
    @IBOutlet private var purchaseView: PurchaseView! {
        didSet {
            purchaseView.center = CGPoint(x: screenBounds.width / 2, y: screenBounds.height / 2)
            setViewBorder(view: purchaseView, configSetting: .viewBorder)
        }
    }
    @IBOutlet private var tauntingView: TauntingView! {
        didSet {
            tauntingView.center = CGPoint(x: screenBounds.width / 2, y: screenBounds.height / 2)
            setViewBorder(view: tauntingView, configSetting: .viewBorder)
        }
    }
    
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
    
    func setUserMoney() {
        userMoney.text = "$ \(UserPersist.shared.user.totalMoney)"
    }

    func showAlertView(shopMode:ShopViewState.shopMode, levelMode: ShopViewState.levelMode, indexPath: IndexPath) {
        if !userPersist.user.purchased.contains(indexPath.row) {
            if userPersist.user.totalMoney >= ShopViewState(shopMode: shopMode, levelMode: levelMode).shopList[indexPath.row].price {
                self.addSubview(purchaseView)
                purchaseView.perpare(mv: self)
                purchaseView.setData(shopMode: shopMode, levelMode: levelMode, indexPath: indexPath)
            } else {
                self.addSubview(tauntingView)
            }
        }
        
    }
}
