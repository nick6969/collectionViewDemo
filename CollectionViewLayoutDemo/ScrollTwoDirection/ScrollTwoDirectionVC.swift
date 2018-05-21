//
//  ScrollTwoDirectionVC.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class ScrollTwoDirectionVC: UIViewController {

    private let flowLayout = ScrollTwoDirectionFlowLayout()
    private lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 170, height: 80)
        flowLayout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)

        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.mLay(pin: .init(top: 0, left: 0, right: 0))
        collectionView.mLayEqualSafeArea(with: view, direction: .bottom)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
    }
}

extension ScrollTwoDirectionVC: UICollectionViewDataSource {

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
