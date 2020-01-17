//
//  CustomHeader.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 13/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class CustomHeaderLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        // 1. Extract the layout attributes
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        // 2. Loop through each attribute and identify which one you want to modify
        layoutAttributes?.forEach({ (attribute) in
            
            // 3. check for Header and (for additional check you can use indexPath whether we want stretchy on 1st header)
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader {
                
                guard let collectionView = collectionView else { return }
                let contentOffsetY = collectionView.contentOffset.y
                
                if contentOffsetY < 0 {
                    let width = collectionView.frame.width
                    // 4. as contentOffsetY is -ve, the height will increase based on contentOffsetY
                    let height = attribute.frame.height - contentOffsetY
                    attribute.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
                }
            }
        })
        
        // 5. return
        return layoutAttributes
    }
    
    // 6. invalidate the layout for new bounds
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
