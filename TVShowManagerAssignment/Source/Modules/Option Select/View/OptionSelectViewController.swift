//
//  OptionSelectViewController.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 29/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import UIKit

class OptionSelectViewController: UIViewController {

    @IBOutlet private weak var addNewTVShowButton: UIButton!
    @IBOutlet private weak var tvShowsListButton: UIButton!

    var output: OptionSelectViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        output.onViewReady()
    }
}
