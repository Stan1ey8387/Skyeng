//
//  WordSectionViewModel.swift
//  Skyeng
//
//  Created by Захар Бабкин on 15.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import UIKit

class WordSectionViewModel {
    let previewUrl: URL?
    let translate: String
    let meanings: String
    let isHaveMore: Bool
    private (set) var meaningsCount: String? = nil
    
    init?(word: Word) {
        translate = word.text
        meanings = word.meanings.compactMap{ $0.translation.text }.joined(separator: ", ")
        isHaveMore = word.meanings.count > 1
        
        if isHaveMore {
            meaningsCount = String(word.meanings.count)
            previewUrl = nil
        } else {
            meaningsCount = nil
            previewUrl = URL(httpsString: word.meanings.first?.previewUrl ?? "")
        }
    }
}
