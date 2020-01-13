//
//  AppDelegate.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 06/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRoot()
        return true
    }

    private func setupRoot() {
      let window = UIWindow(frame: UIScreen.main.bounds)
      let navigator = Navigator()
      window.rootViewController = navigator.navigate(at: .productList)
      window.backgroundColor = .white
      window.makeKeyAndVisible()
//        let window = UIWindow(frame: UIScreen.main.bounds)
//        let navigator = Navigator()
//        window.makeKeyAndVisible()
//        window.backgroundColor = .white
//        window.rootViewController = UINavigationController(rootViewController: navigator.navigate(at: .productList))
      self.window = window
    }


}

