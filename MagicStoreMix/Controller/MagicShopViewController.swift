//
//  MagicShopViewController.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class MagicShopViewController: UIViewController {

    @IBOutlet var changeStateButton: [UIButton]!
    @IBOutlet var moneyView: UIView!
    @IBOutlet var userMoney: UILabel!
    @IBOutlet var magicShopCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefaultProperties()
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    fileprivate func setDefaultProperties() {
        for button in changeStateButton {
            button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            setButtonProperties(button: button, configSetting: .stateButton)
        }
        moneyView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        moneyView.layer.borderWidth = 2
        
    }
    
}

extension MagicShopViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
