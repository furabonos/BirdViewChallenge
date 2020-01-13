//
//  ListCellViewModel.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 07/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class ListCellViewModel {
    
    var price: String
    var thumbnailImage: String
    var title: String
    
    init(content: ListData) {
        self.price = content.price
        self.title = content.title
        self.thumbnailImage = content.thumbnailImage
    }
}
