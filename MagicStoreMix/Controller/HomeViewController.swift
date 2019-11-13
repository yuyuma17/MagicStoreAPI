//
//  ViewController.swift
//  MagicStoreMix
//
//  Created by Jes Yang on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var vc: LoginViewController?
    var playerName: String?
    var playerMoney: Int?
    
    let userPersist = UserPersist.shared
    let correctAnswer = [true, true, false, true, true, false, false]
    
    var didInput = [Bool]() {
        didSet {
            if self.didInput.count == 8 {
                self.didInput.removeFirst()
                print(self.didInput)
            }
            if self.didInput == correctAnswer {
                playerMoney! += 100
                moneyLabel.text = "$ \(playerMoney!)"
            }
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = playerName
        moneyLabel.text = "$ \(playerMoney!)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        didInput = [Bool]()
    }

    @IBAction func aboveButton(_ sender: UIButton) {
        didInput.append(true)
    }
    
    @IBAction func belowButton(_ sender: UIButton) {
        didInput.append(false)
    }
    
    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

