//
//  BaseViewController.swift
//  RandomUserJokes
//
//  Created by Lazar Andonov on 5/7/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func fetchJokesUsing(fistName:String, lastName: String) {
        let fullURL = URL(string: "http://api.icndb.com/jokes/random/10?firstName=\(fistName)&lastName=\(lastName)")
        Alamofire.request(fullURL!).responseJSON(completionHandler: { response in
            if (response.result.value != nil) {
                let json = JSON(response.result.value!).array
                print("\(String(describing: json))")
            }
        })
    }
    

}
