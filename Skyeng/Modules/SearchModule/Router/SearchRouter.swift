//
//  SearchSearchRouter.swift
//  project
//
//  Created by Zakhar on 29/02/2020.
//  Copyright © 2020 Zakhar Babkin. All rights reserved.
//

import UIKit

final class SearchRouter: Router {
    typealias RoutableType = SearchViewModel
    typealias Context = UIViewController

    weak var context: Context?

    func route(to route: SearchViewModel.Routes) {
        switch route {
        case .word(let id):
            if let wordModule = WordBuilder().set(id: id).module {
                context?.navigationController?.pushViewController(wordModule, animated: true)
            }
        }
    }
}
