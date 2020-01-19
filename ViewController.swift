//
//  ViewController.swift
//  Khadim
//
//  Created by Acxiom Consulting on 26/12/19.
//  Copyright © 2019 Acxiom Consulting. All rights reserved.
//

import UIKit

class ViewController: BaseActivity {
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(origin: CGPoint(x: 0, y:username.frame.height - 1), size: CGSize(width: username.frame.width, height:  1))
        bottomLine.backgroundColor = UIColor.red.cgColor
        username.borderStyle = UITextField.BorderStyle.none
        username.layer.addSublayer(bottomLine)
        loginApiCall()
    }
    
    
    
    @IBAction func loginClick(_ sender: UIButton) {
        print("push called------")
        self.push(storybId: "Dashboard", vcId: "dashboard", vc: self)
    }
    
    func loginApiCall() {
        request(ALINetwork.Router.baseURLString + ALINetwork.Router.GET_LOGIN).responseJSON(){(JSON) -> Void in
            let response = JSON.result.value as? NSArray
            print("respons data 2", response)
        }
        
}
}
