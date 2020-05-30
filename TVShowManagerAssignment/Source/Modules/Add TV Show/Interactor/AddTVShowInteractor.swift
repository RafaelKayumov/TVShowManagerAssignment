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

private extension AddTVShowInteractor {

    func validateAndSaveTVShowWith(title: String?, yearOfRelease: String?, numberOfSeasons: String?) {
        guard
            let title = title, title.isEmpty == false,
            let yearOfRelease = yearOfRelease, yearOfRelease.isEmpty == false,
            let numberOfSeasons = numberOfSeasons, numberOfSeasons.isEmpty == false
        else {
            displayValidationAlert()
            return
        }

        let tvShowViewModel = TVShowViewModel(title: title, yearOfRelease: yearOfRelease, numberOfSeasons: numberOfSeasons)
        saveTVShow(model: tvShowViewModel)
    }

    func displayValidationAlert() {
        router.displayAlert(title: "Some fields are empty", message: "Please complete the input")
    }

    func saveTVShow(model: TVShowViewModel) {
        guard let dictionary = model.dictionary else { return }
        parseService.saveObject(objectDictionary: dictionary, type: .tvShow) { (_, error) in
            guard error == nil else {
                DispatchQueue.main.async { [weak self] in
                    self?.router.displayError(error: error!)
                }
                return
            }
        }
    }
}

extension AddTVShowInteractor: AddTVShowViewOutput {

    func onViewReady() {

    }

    func onTVShowSaveWith(title: String?, yearOfRelease: String?, numberOfSeasons: String?) {
        validateAndSaveTVShowWith(title: title, yearOfRelease: yearOfRelease, numberOfSeasons: numberOfSeasons)
    }
}
