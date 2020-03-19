//
//  ExampleViewModel.swift
//  Skyeng
//
//  Created by Захар Бабкин on 17.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import Foundation

final class ExampleViewModel {
    let exampleText: String
    let audioLink: String
    
    init?(definition: Definition) {
        if let exampleText = definition.text, let audioLink = definition.soundUrl {
            self.exampleText = exampleText
            self.audioLink = audioLink
        } else {
            return nil
        }
    }
}
