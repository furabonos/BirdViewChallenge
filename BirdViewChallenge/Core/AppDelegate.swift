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
    var naviController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        setupRoot()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.naviController = UINavigationController(rootViewController: ListViewController())
        self.naviController?.navigationBar.isHidden = false
        self.naviController?.navigationBar.barTintColor = #colorLiteral(red: 0.5641141534, green: 0.07266253978, blue: 0.995624125, alpha: 1)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = self.naviController
        self.window?.makeKeyAndVisible()
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

