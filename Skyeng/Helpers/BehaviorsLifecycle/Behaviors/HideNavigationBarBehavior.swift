//
//  HideNavigationBarBehavior.swift
//  SearchCat
//
//  Created by Захар Бабкин on 03.01.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import UIKit

struct HideNavigationBarBehavior: ViewControllerLifecycleBehavior {
    func beforeAppearing(viewController: UIViewController) {
        viewController.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func beforeDisappearing(viewController: UIViewController) {
        viewController.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
