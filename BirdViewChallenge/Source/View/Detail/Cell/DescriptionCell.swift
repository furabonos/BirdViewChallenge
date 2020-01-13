//
//  DescriptionCell.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 09/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class DescriptionCell: BaseCollectionViewCell {
    
    let descriptionLabel: UILabel = {
        var l = UILabel()
        l.font = UIFont(name: "NotoSansCJKkr-Black", size: 16)
        l.textColor = .black
        l.textAlignment = .left
        l.numberOfLines = 0
        l.backgroundColor = .white
        return l
    }()
    
    let grayView: UIView = {
        var v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9636959434, green: 0.9657513499, blue: 0.9806938767, alpha: 1)
        return v
    }()
    
    let grayTextLabel: UILabel = {
        var l = UILabel()
        l.font = UIFont(name: "NotoSansCJKkr-Black", size: 12)
        l.text = "부랑구마켓은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 부랑구마켓은 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다."
        l.textColor = #colorLiteral(red: 0.6397351027, green: 0.6380736232, blue: 0.7112368941, alpha: 1)
        l.textAlignment = .left
        l.numberOfLines = 0
        l.backgroundColor = .clear
        return l
    }()
    
    let borderView: UIView = {
        var v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9263710976, green: 0.9241108298, blue: 0.9619341493, alpha: 1)
        return v
    }()
    
    
    var viewModel: DescriptionCellViewModel! {
    didSet {
        descriptionLabel.text = viewModel.description
        }
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func setupUI() {
        [descriptionLabel, grayView, borderView].forEach { self.addSubview($0) }
        [grayTextLabel].forEach { self.grayView.addSubview($0) }
    }
    
    override func setupConstraints() {
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
        }
        
        grayView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(68)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(96)
        }
    
        grayTextLabel.snp.makeConstraints {
            $0.top.equalTo(grayView.snp.top).offset(16)
            $0.leading.equalTo(grayView.snp.leading).offset(18)
            $0.trailing.equalTo(grayView.snp.trailing).offset(-18)
            $0.bottom.equalTo(grayView.snp.bottom).offset(-26)
        }
        
        borderView.snp.makeConstraints {
            $0.top.equalTo(grayView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(2)
        }
    }
    
}
