//
//  ViewController.swift
//  MagicStoreMix
//
//  Created by Jes Yang on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let magicBook = AllMagicBooks.shared
    
    var vc: LoginViewController?
    var playerName: String?
    var playerMoney: Int?
    
    var addMoney: AddMoney?
    
    let correctAnswer = [true, true, false, true, true, false, false]
    
    var didInput = [Bool]() {
        didSet {
            if self.didInput.count == 8 {
                self.didInput.removeFirst()
                print(self.didInput)
            }
            if self.didInput == correctAnswer {
                self.addMoneyTip()
            }
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAllMagicBook()
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
    
    func addMoneyTip() {
        let loginData = ShouldPassLoginData(name: "lacie", password: "lacie")
        guard let uploadData = try? JSONEncoder().encode(loginData) else {
            return
        }
        let url = URL(string: "http://vegelephant.club/api/bonus")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
            
            if let error = error {
                print ("error: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                    print ("server error")
                    return
            }
            
            if let mimeType = response.mimeType,
                mimeType == "application/json",
                let data = data,
                let dataString = String(data: data, encoding: .utf8) {
                print (dataString)
                self.decodeData(data)
                
                DispatchQueue.main.async {
                    self.playerMoney = self.addMoney?.user.balance
                    self.moneyLabel.text = "$ \(self.playerMoney!)"
                }
            }
        }
        task.resume()
    }
    
    func decodeData(_ data: Data) {
        let decoder = JSONDecoder()
        if let data = try? decoder.decode(AddMoney.self, from: data) {
            addMoney = data
        }
    }
}

extension HomeViewController {
    
    func getAllMagicBook() {
        
        if let url = URL(string: "http://vegelephant.club/api/shop/1?password=lacie&name=lacie") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("error: \(error.localizedDescription)")
                }
                guard let data = data else { return }
                if let response = response as? HTTPURLResponse {
                    print("status code: \(response.statusCode)")
                    if let magicData = try? JSONDecoder().decode(AllMagicBookItems.self, from: data) {
                        self.magicBook.allMagicBooks = magicData.magics
                    }
                }
            }.resume()
        }
    }
}
