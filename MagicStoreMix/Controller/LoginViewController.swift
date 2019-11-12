//
//  LoginViewController.swift
//  MagicStoreMix
//
//  Created by 黃士軒 on 2019/11/12.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginResult: LoginResult?
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onOffRegister(_ sender: UISwitch) {
        if sender.isOn {
            registerOutlet.isHidden = false
        } else {
            registerOutlet.isHidden = true
        }
    }
    
    @IBAction func logicButton(_ sender: UIButton) {
        
        let loginData = LoginData(name: accountTextField.text!, password: passwordTextField.text!)
        guard let uploadData = try? JSONEncoder().encode(loginData) else {
            return
        }
        let url = URL(string: "http://vegelephant.club/api/login")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "Post"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
            
            if let mimeType = response?.mimeType,
                mimeType == "application/json",
                let data = data {
                self.decodeData(data)
            }
        }
        task.resume()
        
        while loginResult == nil {}
        
        if let homeViewNaviVC = self.storyboard?.instantiateViewController(withIdentifier: "homeViewNaviVC") as? UINavigationController {
            
            let homeViewVC = homeViewNaviVC.viewControllers.first as! HomeViewController
            homeViewVC.vc = self
            homeViewVC.playerName = loginResult?.name
            homeViewVC.playerMoney = loginResult?.balance
            
            self.present(homeViewNaviVC, animated: true)
        }
    }
    
    func decodeData(_ data: Data) {
        let decoder = JSONDecoder()
        if let loginData = try? decoder.decode(LoginResult.self, from: data) {
            loginResult = loginData
        }
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
    }
}
