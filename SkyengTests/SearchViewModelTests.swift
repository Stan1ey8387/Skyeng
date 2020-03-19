//
//  SearchViewModelTests.swift
//  SkyengTests
//
//  Created by Захар Бабкин on 19.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import XCTest
@testable import Skyeng

class SearchViewModelTests: XCTestCase {
    var viewModel: SearchViewModelInput!

    override func setUp() {
        super.setUp()
        viewModel = SearchViewModel(networkManager: MockSkyengManager())
    }

    
    func testEmptyWordsAfterInitionalization() {
        XCTAssertTrue(viewModel.wordSectionViewModels.isEmpty)
        XCTAssertTrue(viewModel.meaningViewModels.isEmpty)
    }
    
    func testSuccessSearchWord() {
        viewModel.search(word: "success")
        XCTAssertEqual(viewModel.wordSectionViewModels.count, 1)
    }
    
    func testFailureSearchWord() {
        viewModel.search(word: "failure")
        XCTAssertEqual(viewModel.wordSectionViewModels.count, 0)
    }
}
 
