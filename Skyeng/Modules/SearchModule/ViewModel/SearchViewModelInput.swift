//
//  SearchSearchViewModelInput.swift
//  project
//
//  Created by Zakhar on 29/02/2020.
//  Copyright © 2020 Zakhar Babkin. All rights reserved.
//

import Foundation

protocol SearchViewModelInput {
    var wordSectionViewModels: [WordSectionViewModel] { get }
    var meaningViewModels: [[MeaningViewModel?]] { get }
    
    func search(word: String)
    func didSelectRow(at section: Int)
    func didSelectRow(at indexPath: IndexPath)
    func getIsNeedExpand(for section: Int) -> Bool
}
