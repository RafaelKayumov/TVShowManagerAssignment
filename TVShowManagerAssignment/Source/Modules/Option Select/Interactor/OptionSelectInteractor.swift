//
//  OptionSelectInteractor.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 30/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import Foundation

class OptionSelectInteractor {
    private let router: Router
    private let modulesAssembly: ModulesAssemblyProtocol

    init(router: Router, modulesAssembly: ModulesAssemblyProtocol) {
        self.router = router
        self.modulesAssembly = modulesAssembly
    }
}

extension OptionSelectInteractor: OptionSelectViewOutput {

    func onViewReady() {

    }

    func onAddNewTVShow() {
        let addTVShowModule = modulesAssembly.addTVShowModule()
        router.pushViewController(addTVShowModule, animated: true)
    }

    func onTVShowList() {
        let tvShowsListModule = modulesAssembly.tvShowsListModule()
        router.pushViewController(tvShowsListModule, animated: true)
    }
}
