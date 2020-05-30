//
//  AddTVShowViewOutput.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 29/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import Foundation

protocol AddTVShowViewOutput: ViewOutput {

    func onTVShowSaveWith(title: String?, yearOfRelease: String?, numberOfSeasons: String?)
}
