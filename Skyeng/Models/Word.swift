//
//  Word.swift
//  Skyeng
//
//  Created by Захар Бабкин on 14.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import Foundation

// MARK: - Word
struct Word: Codable {
    let id: Int?
    let text: String
    let meanings: [Meaning]
}

// MARK: - Meaning
struct Meaning: Codable {
    let id: Int
    let translation: Translation
    let previewUrl: String?
}

// MARK: - Translation
struct Translation: Codable {
    let text: String
    let note: String?
}
