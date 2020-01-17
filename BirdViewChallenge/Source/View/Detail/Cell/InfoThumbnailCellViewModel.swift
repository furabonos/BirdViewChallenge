//
//  InfoThumbnailCellViewModel.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 13/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class InfoThumbnailViewModel {

    var productImage: String
    
    init(content: DetailData) {
        self.productImage = content.fullSizeImage
    }
}
