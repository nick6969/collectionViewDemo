//
//  HorizontalCardFlowLayout.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class HorizontalCardFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        assert(scrollDirection == .horizontal, "This Class Using in horizontal")
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
        guard let array = super.layoutAttributesForElements(in: rect) else { return nil }
        var attributes: [UICollectionViewLayoutAttributes] = []
        for attribute in array {
            let minX = collectionView.bounds.minX + collectionView.contentInset.left + sectionInset.left
            let maxX = attribute.frame.origin.x
            let newOrigin = CGPoint(x: max(minX, maxX), y: attribute.frame.origin.y)
            attribute.frame = CGRect(origin: newOrigin, size: attribute.frame.size)
            attribute.zIndex = attribute.indexPath.row
            attributes.append(attribute)
        }
        return attributes
    }
}
