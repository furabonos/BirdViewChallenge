//
//  ListCell.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 07/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class ListCell: BaseCollectionViewCell {
    
    let thumbnailImageView: UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "error_image")
        iv.backgroundColor = .white
        return iv
    }()
    
    let titleLabel: UILabel = {
        var l = UILabel()
        l.textAlignment = .left
        l.textColor = .black
        l.backgroundColor = .white
        l.numberOfLines = 2
        l.font = UIFont(name: "NotoSansCJKkr-Black", size: 14)
        return l
    }()
    
    let priceLabel: UILabel = {
        var l = UILabel()
        l.textColor = #colorLiteral(red: 0.6709191799, green: 0.6706336737, blue: 0.766911149, alpha: 1)
        l.textAlignment = .left
        l.backgroundColor = .white
        l.font = UIFont(name: "NotoSansCJKkr-Black", size: 14)
        return l
    }()
    
    var viewModel: ListCellViewModel! {
      didSet {
        let imageURL = URL(string: viewModel.thumbnailImage)
        thumbnailImageView.kf.setImage(with: imageURL, placeholder: UIImage(named: "error_image"))
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
        [thumbnailImageView, titleLabel, priceLabel].forEach { self.addSubview($0) }
    }
    
    override func setupConstraints() {
        
        thumbnailImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(self.contentView.snp.width)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.thumbnailImageView.snp.bottom).offset(4)
            $0.leading.equalTo(self.thumbnailImageView.snp.leading).offset(8)
            $0.trailing.equalTo(self.thumbnailImageView.snp.trailing).offset(-8)
            $0.height.equalTo(40)
        }

        priceLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom)
            $0.leading.equalTo(self.titleLabel.snp.leading)
            $0.trailing.equalTo(self.titleLabel.snp.trailing)
        }

    }
    
}
