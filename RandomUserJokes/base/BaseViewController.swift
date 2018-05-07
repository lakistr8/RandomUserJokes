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
    @IBOutlet weak var closeBtn: UIButton!
    let nib = UINib(nibName: "JokesComponent", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! JokesComponent
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
                self.initializeJokesView(data: self.dataSource)
            }
        })
    }
    
    func initializeJokesView(data: [BaseData]) {
        self.closeBtn.isHidden = false
        nib.initSelf(data: data)
        nib.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(nib)
        self.view.bringSubview(toFront: closeBtn)
    }
    
    func close() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func close(_ sender: UIButton!) {
        self.nib.removeFromSuperview()
    }
}
