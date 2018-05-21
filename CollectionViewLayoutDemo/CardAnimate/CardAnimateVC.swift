//
//  CardAnimateVC.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class CardAnimateVC: UIViewController {

    private let flowLayout = CardAnimateFlowLayout()
    private lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 90, height: 180)
        flowLayout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)

        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.mLayCenterXY()
        collectionView.mLay(.width, .equal, view)
        collectionView.mLay(.height, 200)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
    }
}

extension CardAnimateVC: UICollectionViewDataSource {

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
