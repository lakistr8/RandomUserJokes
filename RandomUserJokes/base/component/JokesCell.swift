//
//  HomeCell.swift
//  RandomUserJokes
//
//  Created by Lazar Andonov on 5/7/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit

class JokesCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    
    func fillCell(data: [BaseData]) {
        for item in data {
            self.lbl.text = item.joke
        }
        
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 10
    }
    
}
