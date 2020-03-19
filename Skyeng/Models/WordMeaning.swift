//
//  WordMeaning.swift
//  Skyeng
//
//  Created by Захар Бабкин on 16.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import Foundation

// MARK: - WordValue
struct WordMeaning: Codable {
    let id: String?
    let text: String?
    let soundUrl: String?
    let transcription: String
    let translation: Translation?
    let images: [Image]?
    let definition: Definition
    let examples: [Definition]?
}

// MARK: - Definition
struct Definition: Codable {
    let text: String?
    let soundUrl: String?
}

// MARK: - Image
struct Image: Codable {
    let url: String?
}
