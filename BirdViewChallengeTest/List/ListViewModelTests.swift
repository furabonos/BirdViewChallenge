//
//  ListViewModelTests.swift
//  BirdViewChallengeTest
//
//  Created by Euijae Hong on 15/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import XCTest
@testable import BirdViewChallenge

class ListViewModelTests: XCTestCase {
    
    var viewModel: ListViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ListViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_numberOfSections() {
        XCTAssertEqual(viewModel.numberOfSections(), 1)
    }
    
    func test_getProductList() {
        viewModel.getProductList(skin: "", pages: 1) { (result) in
            switch result {
            case true:
                XCTAssertFalse(self.viewModel.listData.isEmpty)
            case false:
                XCTFail()
            }
        }
    }
    
    func test_getMoreProdustList() {
        viewModel.getMoreProductList(skin: "oily", pages: 2) { (result) in
            switch result {
            case true:
                XCTAssertFalse(self.viewModel.listData.isEmpty)
            case false:
                XCTFail()
            }
        }
    }
    
    func test_getSearchProductList() {
        viewModel.getSearchProductList(search: "브라이트닝") { (result) in
            switch result {
            case true:
                XCTAssertFalse(self.viewModel.listData.isEmpty)
            case false:
                XCTFail()
            }
        }
    }

}
