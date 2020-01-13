//
//  ListViewModel.swift
//  BirdViewChallenge
//
//  Created by Euijae Hong on 06/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import UIKit

class ListViewModel {
    
    private let birdViewService: BirdViewServiceType = BirdViewService()
    var listData: [ListData] = []

    var skinType = ""
    var pageNum = 1
    
    func getProductList(skin: String, pages: Int, completion: @escaping (Bool) -> Void) {
        birdViewService.getBirdViewList(skinType: skin, page: pages) { (result) in
            switch result {
            case .success(let value):
                self.listData = value.body
                completion(true)
            case .failure(let error):
                print("error = \(error)")
                completion(false)
            }
        }
    }
    
    func getMoreProductList(skin: String, pages: Int, completion: @escaping (Bool) -> Void) {
        birdViewService.getBirdViewList(skinType: skin, page: pages) { (result) in
            switch result {
            case .success(let value):
                value.body.forEach { self.listData.append($0) }
                completion(true)
            case .failure(let error):
                print("error = \(error)")
                completion(false)
            }
        }
    }
    
    func getSearchProductList(search: String, completion: @escaping (Bool) -> Void) {
        birdViewService.getSearchBirdViewList(search: search) { (result) in
            switch result {
            case .success(let value):
                self.listData = value.body
                completion(true)
            case .failure(let error):
                print("error = \(error)")
                completion(false)
            }
        }
    }
    
    func numberOfItemsInSection() -> Int {
        return self.listData.count
    }
    
    
}
