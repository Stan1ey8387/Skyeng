//
//  SearchSearchViewModelOutput.swift
//  project
//
//  Created by Zakhar on 29/02/2020.
//  Copyright © 2020 Zakhar Babkin. All rights reserved.
//

protocol SearchViewModelOutput: class, ActivityIndicatorPresentable {
    func updateWords()
    func updateSection(_ section: Int) 
    func showAlert(_ title: String, message: String, titleAction: String)
}
