//
//  MockSkyengManager.swift
//  SkyengTests
//
//  Created by Захар Бабкин on 19.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import Foundation
@testable import Skyeng


class MockSkyengManager: SkyengNetworkProtocol {
    func search(word: String, completion: @escaping (Result<[Word], Error>) -> ()) {
        if word == "success" {
            let word = Word(id: 1, text: "Bar", meanings: [Meaning(id: 1, translation: Translation(text: "Foo", note: nil), previewUrl: nil)])
            completion(.success([word]))
        } else {
            completion(.failure(NetworkError.notData))
        }
    }
    
    func getMeaning(by id: Int, completion: @escaping (Result<[WordMeaning], Error>) -> ()) {
        if id == 1 {
            completion(.success([WordMeaning(id: nil, text: "Bar", soundUrl: nil, transcription: "Foo", translation: nil, images: [], definition: Definition(text: nil, soundUrl: nil), examples: nil)]))
        } else {
            completion(.failure(NetworkError.notData))
        }
    }
}
