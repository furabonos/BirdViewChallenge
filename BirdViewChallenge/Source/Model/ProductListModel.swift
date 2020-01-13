//
//  ProductListModel.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 06/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import Foundation

struct Paging: Decodable {
    var body: [ListData]
    
    enum CodingKeys: String, CodingKey {
        case body
    }
}

struct ListData: Decodable {
    var id: Int
    var price: String
    var oilyScore: Int?
    var dryScore: Int?
    var sensitiveScore: Int?
    var thumbnailImage: String
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case id, price, title
        case oilyScore = "oily_score"
        case dryScore = "dry_score"
        case sensitiveScore = "sensitive_score"
        case thumbnailImage = "thumbnail_image"
    }
}
