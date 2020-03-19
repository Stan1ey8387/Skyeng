//
//  WordWordViewModelOutput.swift
//  project
//
//  Created by Zakhar on 16/03/2020.
//  Copyright © 2020 Zakhar Babkin. All rights reserved.
//

protocol WordViewModelOutput: class, ActivityIndicatorPresentable {
    func update(with meaning: WordMeaning)
    func showAlert(_ title: String, message: String, titleAction: String)
}
