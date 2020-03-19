//
//  MeaningViewModel.swift
//  Skyeng
//
//  Created by Захар Бабкин on 15.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import Foundation

final class MeaningViewModel {
    var previewUrl: URL?
    let translate: String
    
    init?(meaning: Meaning) {
        if let previewLink = meaning.previewUrl {
            previewUrl = URL(httpsString: previewLink)
        } else {
            previewUrl = nil
        }
        translate = meaning.translation.text
    }
}
