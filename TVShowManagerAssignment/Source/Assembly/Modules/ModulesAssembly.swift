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
    private let serviceAssembly: ServiceAssemblyProtocol

    init(router: Router, serviceAssembly: ServiceAssemblyProtocol) {
        self.router = router
        self.serviceAssembly = serviceAssembly
    }

    func optionSelectModule() -> UIViewController {
        let view = OptionSelectViewController.instantiate()
        let module = OptionSelectInteractor(router: router, modulesAssembly: self)

        view.output = module

        return view
    }

    func addTVShowModule() -> UIViewController {
        let view = AddTVShowViewController.instantiate()
        let parseService = serviceAssembly.parseService()
        let module = AddTVShowInteractor(router: router, parseService: parseService, view: view)

        view.output = module

        return view
    }

    func tvShowsListModule() -> UIViewController {
        let view = TVShowListViewController()
        view.title = "TV show list"
        let parseService = serviceAssembly.parseService()
        let module = TVShowListInteractor(router: router, parseService: parseService, view: view)

        view.output = module

        return view
    }
}
