//
//  SettingButtonProperties.swift
//  MagicStoreMix
//
//  Created by 陳姿穎 on 2019/11/7.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

struct ButtonProperties {
    
    static let homePageButton = ButtonProperties(cornerRadius: 10, bordercolor: CGColor(srgbRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), borderWidth: 2.0)
    static let purchaseButton = ButtonProperties(cornerRadius: 10, bordercolor: CGColor(srgbRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), borderWidth: 0.5)
    static let stateButton = ButtonProperties(cornerRadius: 0, bordercolor: CGColor(srgbRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), borderWidth: 2.0)
    
    var cornerRadius: Double
    var bordercolor: CGColor
    var borderWidth: Double
}

// DI
func setProperties(button: UIButton, configSetting: ButtonProperties) {
    button.layer.cornerRadius = CGFloat(configSetting.cornerRadius)
    button.layer.borderColor = configSetting.bordercolor
    button.layer.borderWidth = CGFloat(configSetting.borderWidth)
    button.clipsToBounds = true
}

