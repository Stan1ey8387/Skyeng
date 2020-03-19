//
//  WordWordViewModelInput.swift
//  project
//
//  Created by Zakhar on 16/03/2020.
//  Copyright © 2020 Zakhar Babkin. All rights reserved.
//

protocol WordViewModelInput {
    var wordMeaning: WordMeaning? { get }
    var exampleViewModels: [ExampleViewModel] { get }
    
    func viewIsReady()
    func play(link: String)
    func back()
}
