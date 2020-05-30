//
//  TVShowListInteractor.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 30/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import Foundation

class TVShowListInteractor {
    private let router: Router

    init(router: Router) {
        self.router = router
    }
}

extension TVShowListInteractor: TVShowListViewOutput {
    func onViewReady() {

    }

    func onCellSelectAtIndex(_ index: Int) {

    }
}
