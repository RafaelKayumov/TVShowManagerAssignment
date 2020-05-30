//
//  TVShowCell.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 29/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import UIKit

class TVShowCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseYearLabel: UILabel!
    @IBOutlet private weak var numberOfSeasonsLabel: UILabel!

    var viewModel: TVShowViewModel? {
        didSet {
            titleLabel.text = viewModel?.title
            releaseYearLabel.text = viewModel?.yearOfRelease
            numberOfSeasonsLabel.text = viewModel?.numberOfSeasons
        }
    }
}
