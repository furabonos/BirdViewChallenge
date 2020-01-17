//
//  DescriptionsCell.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 13/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class DescriptionCell: BaseTableViewCell {
    
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
    
    var viewModel: DescriptionCellViewModel! {
    didSet {
        descriptionLabel.text = viewModel.description.replace(target: "\\n", withString: "\n")
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
        [descriptionLabel, grayView].forEach { self.addSubview($0) }
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
            $0.bottom.equalToSuperview().offset(-20)
        }
    
        grayTextLabel.snp.makeConstraints {
            $0.top.equalTo(grayView.snp.top).offset(16)
            $0.leading.equalTo(grayView.snp.leading).offset(18)
            $0.trailing.equalTo(grayView.snp.trailing).offset(-18)
            $0.bottom.equalTo(grayView.snp.bottom).offset(-26)
        }
        
    }

}
