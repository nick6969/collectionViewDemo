//
//  StopHeaderFlowLayout.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class StopHeaderFlowLayout: UICollectionViewFlowLayout {
    fileprivate var section: Int = 0
    convenience init(section: Int) {
        self.init()
        self.section = section
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
        guard collectionView.numberOfSections != 0 else { return nil }
        guard var array = super.layoutAttributesForElements(in: rect) else { return nil }
        if let item = self.layoutAttributesForSupplementaryView(ofKind: UICollectionElementKindSectionHeader, at: IndexPath(item: 0, section: section)) {
            if !array.contains(item) {
                array.append(item)
            }
        }

        for item in array {
            if item.representedElementKind == UICollectionElementKindSectionHeader && item.indexPath.section == section {
                if collectionView.contentOffset.y + collectionView.contentInset.top + collectionView.safeAreaInsets.top > item.frame.minY {
                    var origin = item.frame.origin
                    origin = CGPoint(x: 0, y: collectionView.contentOffset.y + collectionView.contentInset.top + collectionView.safeAreaInsets.top)
                    item.zIndex = 1024
                    item.frame = CGRect.init(origin: origin, size: item.frame.size)
                }
            }
        }

        return array
    }

}
