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

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    var dataSource : [BaseData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func fetchJokesUsing(fistName:String, lastName: String) {
        let fullURL = URL(string: "http://api.icndb.com/jokes/random/10?firstName=\(fistName)&lastName=\(lastName)")
        Alamofire.request(fullURL!).responseJSON(completionHandler: { response in
            if (response.result.value != nil) {
                let json = JSON(response.result.value!)
                let obj = json["value"].array
                for item in obj! {
                    self.dataSource.append(BaseData(data: item))
                }
                
            }
        })
    }
    
    
    func openController(storyboard:String, controller: String) {
        let str = UIStoryboard(name: "\(storyboard)Storyboard", bundle: nil)
        guard let vc = str.instantiateViewController(withIdentifier: "\(controller)ViewController") as? BaseViewController else {
            fatalError("falied to create \(controller) view controller")
        }
        self.show(vc, sender: self)
    }
    
    func close() {
        dismiss(animated: true, completion: nil)
    }
}
