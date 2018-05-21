//
//  VerticalCardVC.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class VerticalCardVC: UIViewController {

    private let flowLayout = VerticalCardFlowLayout()
    private lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 180, height: 180)
        flowLayout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)

        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.mLayCenterXY()
        collectionView.mLay(.height, .equal, view, constant: -200)
        collectionView.mLay(.width, 200)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
    }
}

extension VerticalCardVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count * 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.item % colors.count]
        cell.contentView.backgroundColor = colors[indexPath.item % colors.count]
        return cell
    }

}
