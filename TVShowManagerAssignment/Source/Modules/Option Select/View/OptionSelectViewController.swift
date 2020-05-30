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

    var router: Router?
    var output: OptionSelectViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        output.onViewReady()
    }
}

private extension OptionSelectViewController {
    @IBAction func onAddNewTVShow() {
        output.onAddNewTVShow()
    }

    @IBAction func onTVShowList() {
        output.onTVShowList()
    }
}
