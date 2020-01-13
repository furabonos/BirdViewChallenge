//
//  ListHeaderCell.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 07/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class ListHeaderCell: BaseCollectionViewCell {
    
    let typeLabel: UILabel = {
        var l = UILabel()
        l.font = UIFont(name: "NotoSansCJKkr-Black", size: 13)
        l.textColor = .black
        l.text = "모든 피부 타입"
        return l
    }()
    
    let typeBtn: UIButton = {
        var b = UIButton()
        b.backgroundColor = .white
        b.setImage(UIImage(named: "arrowDown"), for: .normal)
        b.setTitleColor(.yellow, for: .normal)
        return b
    }()
    
    let borderView: UIView = {
        var v = UIView()
        v.backgroundColor = .gray
        return v
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func setupUI() {
        [typeLabel, typeBtn, borderView].forEach { self.addSubview($0) }
        self.backgroundColor = #colorLiteral(red: 0.999905169, green: 1, blue: 0.9998704791, alpha: 1)
//        self.layer.borderColor = UIColor.gray.cgColor
//        self.layer.borderWidth = 1.0
    }
    
    override func setupConstraints() {
        
        typeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalTo(20)
        }
        
        typeBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.typeLabel.snp.trailing)
            $0.width.equalTo(self.typeLabel.snp.height)
            $0.height.equalTo(self.typeLabel.snp.height)
        }
        
        borderView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
        
    }
    
}
