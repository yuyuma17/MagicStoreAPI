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
    @IBOutlet weak var loginBtnOutlet: UIButton!
    @IBOutlet weak var registerBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        accountTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func onOffRegister(_ sender: UISwitch) {
        if sender.isOn {
            registerBtnOutlet.isHidden = false
        } else {
            registerBtnOutlet.isHidden = true
        }
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        let loginData = LoginData(name: accountTextField.text!, password: passwordTextField.text!)
        guard let uploadData = try? JSONEncoder().encode(loginData) else {
            return
        }
        let url = URL(string: "http://vegelephant.club/api/login")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "Post"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
            
            if let error = error {
                print ("error: \(error)")
                return
            }
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                    
                    DispatchQueue.main.async {
                        self.showAlert()
                    }
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
                    
                    if let homeViewNaviVC = self.storyboard?.instantiateViewController(withIdentifier: "homeViewNaviVC") as? UINavigationController {
                        
                        let homeViewVC = homeViewNaviVC.viewControllers.first as! HomeViewController
                        homeViewVC.vc = self
                        homeViewVC.playerName = self.loginResult?.name
                        homeViewVC.playerMoney = self.loginResult?.balance
                        
                        self.present(homeViewNaviVC, animated: true)
                    }
                }
            }
        }
        task.resume()
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
    }
    
    func decodeData(_ data: Data) {
        let decoder = JSONDecoder()
        if let loginData = try? decoder.decode(LoginResult.self, from: data) {
            loginResult = loginData
        }
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "打錯帳號或密碼啦", message: "", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "好啦", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
