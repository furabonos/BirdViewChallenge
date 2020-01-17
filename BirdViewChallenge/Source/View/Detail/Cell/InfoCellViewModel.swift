//
//  InfoCellViewModel.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 09/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class InfoCellViewModel {

    var title: String
    var price: String
    
    init(content: DetailData) {
        self.title = content.title
        self.price = content.price
    }
}
