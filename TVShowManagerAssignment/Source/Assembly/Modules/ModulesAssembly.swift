//
//  ModulesAssembly.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 30/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import UIKit

class ModulesAssembly: ModulesAssemblyProtocol {
    private let router: Router

    init(router: Router) {
        self.router = router
    }

    func optionSelectModule() -> UIViewController {
        let view = OptionSelectViewController.instantiate()
        let module = OptionSelectInteractor(router: router, modulesAssembly: self)

        view.output = module

        return view
    }

    func addTVShowModule() -> UIViewController {
        let view = AddTVShowViewController.instantiate()
        let module = AddTVShowInteractor(router: router)

        view.output = module

        return view
    }

    func tvShowsListModule() -> UIViewController {
        let view = TVShowListViewController()
        let module = TVShowListInteractor(router: router)

        view.output = module

        return view
    }
}
