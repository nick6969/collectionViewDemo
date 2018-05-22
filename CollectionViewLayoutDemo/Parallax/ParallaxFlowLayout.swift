//
//  ParallaxFlowLayout.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/22.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class ParallaxFlowLayout: UICollectionViewFlowLayout {

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
        guard let array = super.layoutAttributesForElements(in: rect) else { return nil }
        guard collectionView.numberOfSections != 0 else { return array }

        for item in array {
            if item.representedElementCategory == .cell && item.indexPath == IndexPath(item: 0, section: 0) && collectionView.contentOffset.y > item.frame.minY {
                item.zIndex = -1
                var origin = item.frame.origin
                origin = CGPoint(x: 0, y: collectionView.contentOffset.y / 2)
                item.frame = CGRect(origin: origin, size: item.frame.size)
            }
        }

        return array
    }

}
