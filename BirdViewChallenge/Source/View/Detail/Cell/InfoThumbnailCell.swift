//
//  InfoThumbnailCell.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 13/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class InfoThumbnailCell: BaseTableViewCell {
    
    let productImageView: UIImageView = {
        var iv = UIImageView()
        iv.backgroundColor = .yellow
        return iv
    }()
    
    var viewModel: InfoThumbnailViewModel! {
    didSet {
        let imageURL = URL(string: viewModel.productImage)
        productImageView.kf.setImage(with: imageURL, placeholder: UIImage(named: "error_image"))
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupUI() {
        [productImageView].forEach { self.addSubview($0) }
    }
    
    override func setupConstraints() {
        
        productImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(self.contentView.snp.width)
        }
        
    }

}
