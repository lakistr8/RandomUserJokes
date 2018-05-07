//
//  LoginViewController.swift
//  RandomUserJokes
//
//  Created by Lazar Andonov on 5/7/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var fistNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fisrtNameBotomLineFieldShow()
        lasrtNameBotomLineFieldShow()
    }

    func fisrtNameBotomLineFieldShow() {
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: fistNameField.frame.size.height - width, width:  fistNameField.frame.size.width, height: fistNameField.frame.size.height)
        
        border.borderWidth = width
        fistNameField.layer.addSublayer(border)
        fistNameField.layer.masksToBounds = true
        
    }
    
    func lasrtNameBotomLineFieldShow() {
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: lastNameField.frame.size.height - width, width:  lastNameField.frame.size.width, height: lastNameField.frame.size.height)
        
        border.borderWidth = width
        lastNameField.layer.addSublayer(border)
        lastNameField.layer.masksToBounds = true
        
    }
    
    @IBAction func login(_ sender: UIButton) {
        
        self.fetchJokesUsing(fistName: fistNameField.text ?? "", lastName: lastNameField.text ?? "")
        self.openController(storyboard: "Home", controller: "Home")
        
    }
    

}
