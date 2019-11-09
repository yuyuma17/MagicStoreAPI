//
//  TauntingView.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/9.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class TauntingView: UIView {

    @IBOutlet var byeByeButton: UIButton! {
        didSet {
            setViewBorder(view: byeByeButton, configSetting: .purchaseButton)
        }
    }
    
    @IBAction func tapToByeBye(_ sender: UIButton) {
        self.removeFromSuperview()
    }
}
