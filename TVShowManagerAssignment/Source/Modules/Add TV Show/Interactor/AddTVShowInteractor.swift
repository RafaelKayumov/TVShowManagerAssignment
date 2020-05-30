//
//  AddTVShowInteractor.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 30/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import Foundation

class AddTVShowInteractor {
    private let router: Router
    private let parseService: ParseServiceProtocol

    init(router: Router, parseService: ParseServiceProtocol) {
        self.router = router
        self.parseService = parseService
    }
}

extension AddTVShowInteractor: AddTVShowViewOutput {

    func onViewReady() {

    }

    func onTVShowSave(tvShowModel: TVShowViewModel) {

    }
}
