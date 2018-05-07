//
//  BaseViewControllerProtocol.swift
//  RandomUserJokes
//
//  Created by Lazar Andonov on 5/7/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import Foundation

protocol BaseViewControllerProtocol {
    func openController(storyboard:String, controller: String)
    func close()
}
