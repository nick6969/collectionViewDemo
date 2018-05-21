//
//  ScrollTwoDirectionFlowLayout.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class ScrollTwoDirectionFlowLayout: UICollectionViewFlowLayout {

    override var collectionViewContentSize: CGSize {
        return CGSize(width: super.collectionViewContentSize.width + 100, height: super.collectionViewContentSize.height + 100)
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let array = super.layoutAttributesForElements(in: rect) else { return nil }
        for item in array where item.indexPath.item % 2 == 1 {
            let newX = item.frame.minX + 100
            item.frame = CGRect(x: newX, y: item.frame.minY, width: item.frame.width, height: item.frame.height)
        }
        return array
    }
}
