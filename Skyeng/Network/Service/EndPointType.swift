//
//  EndPointType.swift
//  Skyeng
//
//  Created by Захар Бабкин on 15.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

