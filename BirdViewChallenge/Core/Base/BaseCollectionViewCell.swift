//
//  BaseCollectionViewCell.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 07/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      
      setupUI()
      setupConstraints()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)

      setupUI()
      setupConstraints()
    }
    
    
    //MARK:- Methods
    
    func setupUI() { }
    
    func setupConstraints() { }
    
}
