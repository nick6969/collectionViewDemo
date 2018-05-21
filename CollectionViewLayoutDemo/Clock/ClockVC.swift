//
//  ClockVC.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class ClockVC: UIViewController {

    private let layout = ClockLayout()
    private lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.mLayCenterXY()
        collectionView.mLay(.width, .equal, view)
        collectionView.mLay(.height, .equal, collectionView, .width)
        collectionView.register(ClockCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension ClockVC: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ClockCell
        cell.label.text = "\(indexPath.item + 1)"
        cell.backgroundColor = .red
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.layer.cornerRadius = cell.bounds.width / 2
        cell.layer.masksToBounds = false
    }

}
