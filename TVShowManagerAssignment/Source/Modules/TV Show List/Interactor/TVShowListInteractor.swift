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
    private let parseService: ParseServiceProtocol
    private unowned let view: TVShowListViewInput

    init(router: Router, parseService: ParseServiceProtocol, view: TVShowListViewInput) {
        self.router = router
        self.parseService = parseService
        self.view = view
    }
}

private extension TVShowListInteractor {

    func fetchObjectsAndDisplay() {
        fetchObjects { [weak self] in
            self?.displayObjects($0)
        }
    }

    func fetchObjects(completion: ([TVShowViewModel]) -> Void) {
        parseService.queryObjectsWith(type: .tvShow) { (objects, error) in
            DispatchQueue.main.async { [weak self] in
                guard error == nil else {
                    self?.router.displayError(error: error!)
                    return
                }

                let viewModels = objects?.compactMap { TVShowViewModel(parseObject: $0) }
                self?.displayObjects(viewModels ?? [])
            }
        }
    }

    func displayObjects(_ objects: [TVShowViewModel]) {
        view.consumeModels(objects)
    }
}

extension TVShowListInteractor: TVShowListViewOutput {

    func onViewReady() {
        fetchObjectsAndDisplay()
    }
}
