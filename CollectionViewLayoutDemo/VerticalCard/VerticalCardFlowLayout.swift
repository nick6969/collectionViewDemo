//
//  VerticalCardFlowLayout.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class VerticalCardFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        assert(scrollDirection == .vertical, "This Class Using in vertical")
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
        guard let array = super.layoutAttributesForElements(in: rect) else { return nil }
        var attributes: [UICollectionViewLayoutAttributes] = []
        for attribute in array {
            let minY = collectionView.bounds.minY + collectionView.contentInset.top + sectionInset.top
            let maxY = attribute.frame.origin.y
            let newOrigin = CGPoint(x: attribute.frame.origin.x, y: max(minY, maxY))
            attribute.frame = CGRect(origin: newOrigin, size: attribute.frame.size)
            attribute.zIndex = attribute.indexPath.row
            attributes.append(attribute)
        }
        return attributes
    }
}
