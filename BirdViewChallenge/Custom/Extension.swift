//
//  Extension.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 13/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import Foundation

extension String {
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target,
                    with: withString,
                    options: NSString.CompareOptions.literal,
                    range: nil)
    }
}



