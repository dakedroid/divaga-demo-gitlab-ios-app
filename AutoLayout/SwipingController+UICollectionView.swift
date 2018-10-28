//
//  SwipingController+UICollectionView.swift
//  AutoLayout
//
//  Created by Kevin Molina on 28/10/18.
//  Copyright © 2018 Kevin Molina. All rights reserved.
//

import UIKit

extension SwipingController {
    
    
    // number of items collectionView
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    // cell for item collectionView
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        
        let page = pages[indexPath.item]
        cell.page = page
        
        
        return cell
    }
    
    //size for item
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    // minimun line spacing
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
