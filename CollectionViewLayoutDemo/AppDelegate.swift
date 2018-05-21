//
//  AppDelegate.swift
//  CollectionViewLayoutDemo
//
//  Created by Nick Lin on 2018/5/20.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit
import mLayout

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: MainVC())
        return true
    }

}

public func print<T>(msg: T, file: String = #file, method: String = #function, line: Int = #line) {
    Swift.print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(msg)")
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return (0 <= index && index < count) ? self[index] : nil
    }
}
