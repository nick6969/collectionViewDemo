//
//  ClockLayout.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class ClockLayout: UICollectionViewLayout {

    fileprivate var clockItemAttributes: [UICollectionViewLayoutAttributes] = []

    fileprivate let startAngle: CGFloat = .pi * 10 / 12
    fileprivate let unitAngel: CGFloat = .pi * 2 / 12

    override var collectionViewContentSize: CGSize {
        return collectionView?.bounds.size ?? .zero
    }

    override func prepare() {
        clockItemAttributes = []
        for i in 0..<12 {
            let index = IndexPath(item: i, section: 0)
            if let attrib = self.layoutAttributesForItem(at: index) {
                clockItemAttributes.append(attrib)
            }
        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return clockItemAttributes
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let collectionView = collectionView else { return nil }
        let width = collectionView.bounds.width
        let r = width * 0.4
        let angle = startAngle - unitAngel * CGFloat(indexPath.item)
        let offsetX = sin(angle) * r
        let offsetY = cos(angle) * r
        let x = width / 2 + offsetX - width / 20
        let y = width / 2 + offsetY - width / 20
        let size = width / 10
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.frame = CGRect(x: x, y: y, width: size, height: size)
        return attributes
    }

}
