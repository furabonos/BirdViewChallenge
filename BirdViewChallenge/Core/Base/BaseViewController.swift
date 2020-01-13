//
//  BaseViewController.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 06/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        bind()
    }
    
    func setupUI() {}
    func setupConstraints() {}
    func bind() {}

}
