//
//  WordWordBuilder.swift
//  project
//
//  Created by Zakhar on 16/03/2020.
//  Copyright © 2020 Zakhar Babkin. All rights reserved.
//

import UIKit

final class WordBuilder: Builder {
    private var id: Int?
    
    var module: UIViewController? {
        guard let viewController = UIStoryboard(name: "Word", bundle: nil).instantiateInitialViewController() as? WordViewController else { return nil }
        guard let id = id else { return nil }
        let viewModel = WordViewModel(id: id, networkManager: SkyengNetworkManager.shared, player: PlayerService())
        let router = WordRouter()

        router.context = viewController
        viewModel.router = router
        viewModel.view = viewController
        viewController.viewModel = viewModel

        return viewController
    }
    
    func set(id: Int) -> WordBuilder {
        self.id = id
        return self
    }
}
