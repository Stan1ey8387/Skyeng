//
//  SearchSearchBuilder.swift
//  project
//
//  Created by Zakhar on 29/02/2020.
//  Copyright © 2020 Zakhar Babkin. All rights reserved.
//

import UIKit

final class SearchBuilder: Builder {
    var module: UIViewController? {
        guard let viewController = UIStoryboard(name: "Search", bundle: nil).instantiateInitialViewController() as? SearchViewController else { return nil }
        let viewModel = SearchViewModel(networkManager: SkyengNetworkManager.shared)
        let router = SearchRouter()

        router.context = viewController
        viewModel.router = router
        viewModel.view = viewController
        viewController.viewModel = viewModel

        return viewController
    }
}
