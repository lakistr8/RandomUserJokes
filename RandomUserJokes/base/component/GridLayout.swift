//
//  GridLayout.swift
//  RandomUserJokes
//
//  Created by Lazar Andonov on 5/7/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.itemSize = CGSize(width: 150, height: 150)
        self.minimumInteritemSpacing = 10
        self.minimumLineSpacing = 10
        self.sectionInset = .init(top: 20, left: 20, bottom: 20, right: 20)
        self.scrollDirection = .vertical
        
    }
}
