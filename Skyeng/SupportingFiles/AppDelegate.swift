//
//  AppDelegate.swift
//  Skyeng
//
//  Created by Захар Бабкин on 29.02.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        openSearch()
        return true
    }
    
    private func openSearch() {
        if let searchModule = SearchBuilder().module {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = UINavigationController(rootViewController: searchModule)
            window?.makeKeyAndVisible()
        }
    }
}

