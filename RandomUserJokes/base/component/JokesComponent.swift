//
//  JokesComponent.swift
//  RandomUserJokes
//
//  Created by Lazar Andonov on 5/7/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit

class JokesComponent: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var img: UIImageView!
    var data: [BaseData] = []
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.register(UINib(nibName: "JokesCell", bundle: nil), forCellWithReuseIdentifier: "JokesCell")
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = img.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        img.addSubview(blurEffectView)
    }
    
    func initSelf(data: [BaseData]) {
        self.data = data
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JokesCell", for: indexPath) as! JokesCell
        
        cell.fillCell(data: [self.data[indexPath.row]])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! GridLayout
        
        let availableWidth = collectionView.bounds.size.width
        let columns = (availableWidth / 4 > 150) ? 4 : 2
        var itemTotalWidth = availableWidth - CGFloat(columns-1) * layout.minimumInteritemSpacing
        itemTotalWidth -= (layout.sectionInset.left + layout.sectionInset.right)
        
        let itemWidth = itemTotalWidth / CGFloat(columns)
        return CGSize(width: itemWidth, height: itemWidth * 2)
    }
    
    
    @IBAction func close(_ sender: UIButton!) {
        self.removeFromSuperview()
    }

}
