//
//  DetailViewModelTests.swift
//  BirdViewChallengeTest
//
//  Created by Euijae Hong on 28/01/2020.
//  Copyright © 2020 Taehyeong. All rights reserved.
//

import XCTest
@testable import BirdViewChallenge

class DetailViewModelTests: XCTestCase {
    
    var viewModel: DetailViewModel!

    override func setUp() {
        viewModel = DetailViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_numberOfSections() {
        XCTAssertEqual(viewModel.numberOfSections(), 1)
    }
    
    func test_getDetailInfo() {
        viewModel.getDetailInfo(ids: 536) { (result) in
            switch result {
            case true:
                XCTAssertFalse(self.viewModel.detailData.isEmpty)
            case false:
                XCTFail()
            }
        }
    }

}
