//
//  SkyengNetworkManager.swift
//  Skyeng
//
//  Created by Захар Бабкин on 15.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import Foundation


protocol SkyengNetworkProtocol {
    func search(word: String, completion: @escaping (Result<[Word], Error>) -> ())
    func getMeaning(by id: Int, completion: @escaping(Result<[WordMeaning], Error>) -> ())
}

final class SkyengNetworkManager: SkyengNetworkProtocol {
    static let shared: SkyengNetworkProtocol = SkyengNetworkManager()
    
    private let router = NetworkRouter<SkyengEndPoint>()
    
    private init() {}
    
    
    func search(word: String, completion: @escaping (Result<[Word], Error>) -> ()) {
        router.request(.search(woard: word)) { (data, response, error) in
            guard error == nil else {
                completion(.failure(NetworkError.badConnect))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.notData))
                return }
            
            do {
                let words = try JSONDecoder().decode([Word].self, from: data)
                completion(.success(words))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func getMeaning(by id: Int, completion: @escaping(Result<[WordMeaning], Error>) -> ()) {
        router.request(.meanings(id)) { (data, response, error) in
            guard error == nil else {
                completion(.failure(NetworkError.badConnect))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.notData))
                return }
            
            do {
                let words = try JSONDecoder().decode([WordMeaning].self, from: data)
                completion(.success(words))
            } catch {
                completion(.failure(error))
            }
        }
    }
}

