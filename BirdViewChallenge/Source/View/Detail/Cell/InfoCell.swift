//
//  InfoCell.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 09/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class InfoCell: BaseCollectionViewCell {
    
    let productImageView: UIImageView = {
        var iv = UIImageView()
        iv.backgroundColor = .yellow
        return iv
    }()
    
    let titleLabel: UILabel = {
        var l = UILabel()
        l.font = UIFont(name: "NotoSansCJKkr-Black", size: 32)
        l.textColor = .black
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    let priceLabel: UILabel = {
        var l = UILabel()
        l.font = UIFont(name: "NotoSansCJKkr-Black", size: 20)
        l.textColor = #colorLiteral(red: 0.5641141534, green: 0.07266253978, blue: 0.995624125, alpha: 1)
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    let borderView: UIView = {
        var v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9263710976, green: 0.9241108298, blue: 0.9619341493, alpha: 1)
        return v
    }()
    
    var viewModel: InfoCellViewModel! {
    didSet {
        let imageURL = URL(string: viewModel.productImage)
        productImageView.kf.setImage(with: imageURL, placeholder: UIImage(named: "error_image"))
        titleLabel.text = viewModel.title
        priceLabel.text = "\(viewModel.price)원"
        }
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func setupUI() {
        [productImageView, titleLabel, priceLabel, borderView].forEach { self.addSubview($0) }
    }
    
    override func setupConstraints() {
        productImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(self.contentView.snp.width)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(34)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            
        }
        
        borderView.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(2)
        }
        
        clipsToBounds = true
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
}
