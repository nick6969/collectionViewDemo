//
//  CardAnimateFlowLayout.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class CardAnimateFlowLayout: UICollectionViewFlowLayout {

    fileprivate var baseOffset: CGFloat {
        return itemSize.width * 0.8
    }

    override func prepare() {
        super.prepare()
        assert(scrollDirection == .horizontal, "This Class Using in scrollDirection Horizontal")
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        guard let collectionView = collectionView else { return nil }
        guard let array = super.layoutAttributesForElements(in: rect) else { return nil }

        var attributes: [UICollectionViewLayoutAttributes] = []

        for i in 0..<array.count {
            guard let firstAttribute = array[safe: i] else { continue }
            let minX = collectionView.bounds.minX + collectionView.contentInset.left + sectionInset.left + collectionView.safeAreaInsets.left
            let maxX = firstAttribute.frame.origin.x
            let newOrigin = CGPoint(x: max(minX, maxX), y: firstAttribute.frame.origin.y)
            firstAttribute.frame = CGRect(origin: newOrigin, size: firstAttribute.frame.size)
            firstAttribute.zIndex = firstAttribute.indexPath.row
            attributes.append(firstAttribute)

            guard let nextAttribute = array[safe: i+1] else { continue }
            let space = nextAttribute.frame.minX - minX
            firstAttribute.alpha = min(space / baseOffset * 0.7, 0.7) + 0.3

            let scale: CGFloat = space >= baseOffset ? 1 : (0.9 + space / baseOffset * 0.1)
            let offset = firstAttribute.frame.width / 2 * (scale - 1)
            firstAttribute.transform = CGAffineTransform(a: scale, b: 0, c: 0, d: scale, tx: offset, ty: 0)
        }

        return attributes
    }
}
