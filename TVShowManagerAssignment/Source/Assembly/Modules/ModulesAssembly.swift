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
        let module = OptionSelectInteractor(router: self.router)

        view.output = module

        return view
    }
}
