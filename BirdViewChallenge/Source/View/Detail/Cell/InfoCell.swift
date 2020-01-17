//
//  InfoDetailCell.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 13/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class InfoCell: BaseTableViewCell {
    
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
    
    var viewModel: InfoCellViewModel! {
    didSet {
        titleLabel.text = viewModel.title
        //
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let price = Int(viewModel.price)!
        let result = numberFormatter.string(from: NSNumber(value:price))!
        priceLabel.text = "\(result)원"
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
        self.backgroundColor = .white
        [titleLabel, priceLabel].forEach { self.addSubview($0) }
    }
    
    override func setupConstraints() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(34)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
//            $0.height.equalTo(144)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        
        
    }

}
