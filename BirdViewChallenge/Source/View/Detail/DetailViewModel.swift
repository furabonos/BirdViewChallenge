//
//  DetailViewModel.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 09/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class DetailViewModel {
    
    private let birdViewService: BirdViewServiceType = BirdViewService()
    var detailData: [DetailData] = []
    
    func getDetailInfo(ids: Int, completion: @escaping (Bool) -> Void) {
        birdViewService.getDetailInfo(num: ids) { (result) in
            switch result {
            case .success(let value):
                self.detailData = [value.body]
                print("Fdfds = \(self.detailData[0])")
                completion(true)
            case .failure(let error):
                completion(false)
            }
        }
    }
    
    func numberOfItemsInSection() -> Int {
        return self.detailData.count + 2
    }
    
}
