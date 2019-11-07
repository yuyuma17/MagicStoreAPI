//
//  ViewController.swift
//  MagicStoreMix
//
//  Created by Jes Yang on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var userMoney = 2000
    let correctAnswer = [true, true, false, true, true, false, false]
    
    var didInput = [Bool]() {
        didSet {
            if self.didInput.count == 8 {
                self.didInput.removeFirst()
            }
            if self.didInput == correctAnswer {
                userMoney += 100
                moneyLabel.text = "\(userMoney)"
            }
        }
    }
    
    @IBOutlet weak var moneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moneyLabel.text = "\(userMoney)"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        didInput = [Bool]()
    }

    @IBAction func aboveButton(_ sender: UIButton) {
        didInput.append(true)
    }
    
    @IBAction func belowButton(_ sender: UIButton) {
        didInput.append(false)
    }
}

