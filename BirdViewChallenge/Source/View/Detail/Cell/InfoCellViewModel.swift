//
//  InfoCellViewModel.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 09/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class InfoCellViewModel {

    var productImage: String
    var title: String
    var price: String
    
    init(content: DetailData) {
        self.productImage = content.fullSizeImage
        self.title = content.title
        self.price = content.price
    }
}
