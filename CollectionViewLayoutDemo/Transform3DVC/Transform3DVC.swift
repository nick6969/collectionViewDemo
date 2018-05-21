//
//  Transform3DVC.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit
import LNICoverFlowLayout

class Transform3DVC: UIViewController {

    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.coverFlowLayout)
    lazy var coverFlowLayout: LNICoverFlowLayout = {
        let coverFlowLayout = LNICoverFlowLayout()
        coverFlowLayout.scrollDirection = .horizontal
        coverFlowLayout.maxCoverDegree = 30
        coverFlowLayout.coverDensity = 0.05
        coverFlowLayout.minCoverScale = 0.8
        coverFlowLayout.minCoverOpacity = 1
        return coverFlowLayout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        let width = UIScreen.main.bounds.width * 0.6
        let height = width / 32 * 14
        coverFlowLayout.itemSize = CGSize(width: width, height: height)
        view.addSubview(collectionView)
        collectionView.mLay(.width, .equal, view)
        collectionView.mLayCenterXY()
        collectionView.mLay(.height, height + 60)

        collectionView.register(Transform3DCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
    }
}

extension Transform3DVC: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count * 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Transform3DCell
        cell.backgroundColor = colors[indexPath.item % colors.count]
        return cell
    }
}
