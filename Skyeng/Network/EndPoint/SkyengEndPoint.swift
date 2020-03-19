//
//  SkyengEndPoint.swift
//  Skyeng
//
//  Created by Захар Бабкин on 15.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import Foundation


public enum SkyengEndPoint {
    case search(woard: String)
    case meanings(Int)
}

extension SkyengEndPoint: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: "https://dictionary.skyeng.ru") else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .search:
            return "/api/public/v1/words/search"
        case .meanings:
            return "api/public/v1/meanings"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .search:
            return .get
        case .meanings:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .search(let word):
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: ["search": word])
        case .meanings(let id):
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: ["ids": "\(id)"])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
