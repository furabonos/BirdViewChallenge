//
//  Navigator.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 06/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

struct Navigator {

  enum Scene {
    case productList
    case detail(id: Int)
  }

  func navigate(at scene: Scene) -> UIViewController {
    switch scene {
    case .productList:
      let viewController: ListViewController = ListViewController()
      return viewController
    case .detail(id: let ids):
        let viewController = DetailViewController(ids: ids)
        return viewController
    }
  }

}
