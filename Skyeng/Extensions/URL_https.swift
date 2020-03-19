//
//  URL_https.swift
//  Skyeng
//
//  Created by Захар Бабкин on 16.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import Foundation


extension URL {
    init?(httpsString: String) {
        self.init(string: "https:\(httpsString)")
    }
}

