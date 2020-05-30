//
//  AddTVShowViewController.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 29/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import UIKit

class AddTVShowViewController: UIViewController, StoryboardBased {

    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var releaseYearTextField: UITextField!
    @IBOutlet private weak var numberOfSeasonsTextField: UITextField!
    @IBOutlet private weak var saveButton: UIButton!

    var router: Router?
    var output: AddTVShowViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        output.onViewReady()
    }
}
