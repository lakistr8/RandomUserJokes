//
//  BaseData.swift
//  RandomUserJokes
//
//  Created by Lazar Andonov on 5/7/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct BaseData {
    
    var id: Int
    var joke: String
    
    init(data:JSON) {
        self.id = data["id"].intValue
        self.joke = data["joke"].stringValue
    }
    
    
}
