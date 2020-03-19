//
//  UIImage_Kingfisher.swift
//  Skyeng
//
//  Created by Захар Бабкин on 16.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(url: URL?, placeholder: UIImage? = UIImage(named: "placeholder"), indicator: Bool = false) {
        self.kf.setImage(with: url, placeholder: placeholder)
        self.kf.indicatorType = indicator ? .activity : .none
    }
}
