//
//  Result.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 06/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Data?, Error)
}
