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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in changeStateButton {
            button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        }
        
    }
    

}
