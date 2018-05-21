//
//  Transform3DCell.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

class Transform3DCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        layer.cornerRadius = 10
        layer.borderColor = UIColor.init(red: 0xc8/0xff, green: 0xc8/0xff, blue: 0xc8/0xff, alpha: 1).cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
    }

}
