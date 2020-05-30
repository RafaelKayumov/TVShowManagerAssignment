//
//  OptionSelectViewController.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 29/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import UIKit

class OptionSelectViewController: UIViewController, StoryboardBased {

    @IBOutlet private weak var addNewTVShowButton: UIButton!
    @IBOutlet private weak var tvShowsListButton: UIButton!

    weak var router: Router?
    var output: OptionSelectViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        output.onViewReady()
    }
}
