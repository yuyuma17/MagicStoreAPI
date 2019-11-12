//
//  LoginViewController.swift
//  MagicStoreMix
//
//  Created by 黃士軒 on 2019/11/12.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                let data = data,
                let dataString = String(data: data, encoding: .utf8) {
                print (dataString)
            }
        }
        task.resume()
//        performSegue(withIdentifier: "loginToHomePage", sender: nil)
    }
}
