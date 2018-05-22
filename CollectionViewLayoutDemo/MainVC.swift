//
//  MainVC.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

let colors: [UIColor] = [.blue, .red, .green, .brown, .purple]

class MainVC: UIViewController {

    private lazy var buttonClourse: ( (String) -> UIButton) = { title in
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle( title, for: .normal)
        button.addTarget(self, action: #selector(self.didTap(button:)), for: .touchUpInside)
        return button
    }

    lazy var scrollTwoDirectionButton: UIButton = buttonClourse("冷知識一")
    lazy var clockButton: UIButton = buttonClourse("時鐘")
    lazy var decorationViewButton: UIButton = buttonClourse("背景分段顏色")
    lazy var horizontalCardButton: UIButton = buttonClourse("橫向卡牌")
    lazy var verticalCardButton: UIButton = buttonClourse("直向卡牌")
    lazy var cardAnimateButton: UIButton = buttonClourse("卡牌動畫")
    lazy var stopHeaderButton: UIButton = buttonClourse("固定 Header")
    lazy var transform3DButton: UIButton = buttonClourse("3D 動畫")
    lazy var parallaxButton: UIButton = buttonClourse("Parallax")

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(self.scrollTwoDirectionButton)
        stackView.addArrangedSubview(self.clockButton)
        stackView.addArrangedSubview(self.decorationViewButton)
        stackView.addArrangedSubview(self.horizontalCardButton)
        stackView.addArrangedSubview(self.verticalCardButton)
        stackView.addArrangedSubview(self.cardAnimateButton)
        stackView.addArrangedSubview(self.stopHeaderButton)
        stackView.addArrangedSubview(self.transform3DButton)
        stackView.addArrangedSubview(self.parallaxButton)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UICollectionViewLayout 測試"
        view.addSubview(stackView)
        stackView.mLay(pin: .init(top: 100, left: 20, bottom: 60, right: 20))
    }
    
    @objc private func didTap(button: UIButton) {
        switch button {
        case scrollTwoDirectionButton:
            navigationController?.pushViewController(ScrollTwoDirectionVC(), animated: true)
        case clockButton:
            navigationController?.pushViewController(ClockVC(), animated: true)
        case decorationViewButton:
            navigationController?.pushViewController(BackgroundColorVC(), animated: true)
        case horizontalCardButton:
            navigationController?.pushViewController(HorizontalCardVC(), animated: true)
        case verticalCardButton:
            navigationController?.pushViewController(VerticalCardVC(), animated: true)
        case cardAnimateButton:
            navigationController?.pushViewController(CardAnimateVC(), animated: true)
        case stopHeaderButton:
            navigationController?.pushViewController(StopHeaderVC(), animated: true)
        case transform3DButton:
            navigationController?.pushViewController(Transform3DVC(), animated: true)
        case parallaxButton:
            navigationController?.pushViewController(ParallaxVC(), animated: true)
        default:
            break
        }
    }

}

