//
//  BackgroundColorFlowLayout.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class BackgroundColorFlowLayout: UICollectionViewFlowLayout {
    private let decorationView = "decorationView"
    private var decorationViewAttrs: [UICollectionViewLayoutAttributes] = []

    override init() {
        super.init()
        register(BackgroundColorReusableView.classForCoder(), forDecorationViewOfKind: decorationView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView, let delegate = collectionView.delegate as? BackgroundColorFlowLayoutDelegate else { return }

        self.decorationViewAttrs.removeAll()

        for section in 0..<collectionView.numberOfSections {

            let numberOfItems = collectionView.numberOfItems(inSection: section)

            guard numberOfItems > 0 else { continue }

            guard let firstItem = self.layoutAttributesForItem(at: IndexPath(item: 0, section: section)) else { continue }

            guard let lastItem = self.layoutAttributesForItem(at: IndexPath(item: numberOfItems - 1, section: section)) else { continue }

            var sectionInset = self.sectionInset

            if let inset = delegate.collectionView?(collectionView, layout: self, insetForSectionAt: section) {
                sectionInset = inset
            }

            var sectionFrame = firstItem.frame.union(lastItem.frame)

            sectionFrame.origin.x = 0

            sectionFrame.origin.y -= sectionInset.top

            if scrollDirection == .horizontal {
                sectionFrame.size.width += sectionInset.left + sectionInset.right
                sectionFrame.size.height = collectionView.frame.height
            } else {
                sectionFrame.size.width = collectionView.frame.width
                sectionFrame.size.height += sectionInset.top + sectionInset.bottom
            }

            let attr = BackgroundColorLayoutAttributes(forDecorationViewOfKind: decorationView, with: IndexPath(item: 0, section: section))

            attr.frame = sectionFrame

            attr.zIndex = -1

            attr.backgroundColor = delegate.collectionView(collectionView, layout: self, backgroundColorForSectionAt: section) ?? .clear
            self.decorationViewAttrs.append(attr)
        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attrs = super.layoutAttributesForElements(in: rect)
        attrs?.append(contentsOf: decorationViewAttrs.filter { rect.intersects($0.frame) })
        return attrs
    }
}

class BackgroundColorLayoutAttributes: UICollectionViewLayoutAttributes {
    var backgroundColor = UIColor.clear
}

class BackgroundColorReusableView: UICollectionReusableView {

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)

        guard let attr = layoutAttributes as? BackgroundColorLayoutAttributes else { return }

        backgroundColor = attr.backgroundColor
    }
}

protocol BackgroundColorFlowLayoutDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, backgroundColorForSectionAt section: Int) -> UIColor?
}

extension BackgroundColorFlowLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, backgroundColorForSectionAt section: Int) -> UIColor? {
        return .clear
    }
}
