//
//  DescriptionCellViewModel.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 09/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class DescriptionCellViewModel {

    var description: String
    
    init(content: DetailData) {
        self.description = content.description
    }
}
