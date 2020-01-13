//
//  ProductDetailModel.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 08/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import Foundation

struct Details: Decodable {
    var body: DetailData
    
    enum CodingKeys: String, CodingKey {
        case body
    }
}

struct DetailData: Decodable {
    var id: Int
    var fullSizeImage: String
    var title: String
    var description: String
    var price: String
    var oilyScore: Int
    var dryScore: Int
    var sensitiveScore: Int
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, price
        case fullSizeImage = "full_size_image"
        case oilyScore = "oily_score"
        case dryScore = "dry_score"
        case sensitiveScore = "sensitive_score"
    }
}

