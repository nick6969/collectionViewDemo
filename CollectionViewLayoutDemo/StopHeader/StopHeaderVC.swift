//
//  StopHeaderVC.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class StopHeaderVC: UIViewController {

    private let flowLayout = StopHeaderFlowLayout.init(section: 3)
    private lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 170, height: 80)
        flowLayout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        flowLayout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)

        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.mLay(pin: .init(top: 0, left: 0, right: 0))
        collectionView.mLayEqualSafeArea(with: view, direction: .bottom)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.register(StopHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: UICollectionElementKindSectionHeader)
    }
}

extension StopHeaderVC: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.item % colors.count]
        cell.contentView.backgroundColor = colors[indexPath.item % colors.count]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kind, for: indexPath) as! StopHeaderReusableView
            view.backgroundColor = .yellow
            view.label.text = "這是第 \(indexPath.section) 個 Section"
            return view
        }
        return UICollectionReusableView()
    }

}

class StopHeaderReusableView: UICollectionReusableView {

    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(label)
        label.mLay(pin: .init(top: 10, left: 20, bottom: 10, right: 20))
    }
}
