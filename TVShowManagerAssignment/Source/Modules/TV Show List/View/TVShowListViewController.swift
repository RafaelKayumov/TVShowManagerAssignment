//
//  TVShowListViewController.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 29/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import UIKit

class TVShowListViewController: UITableViewController {

    weak var router: Router?
    weak var output: TVShowListViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()

        output.onViewReady()
    }
}

extension TVShowListViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}

private extension TVShowListViewController {

    func reloadTableData() {
        tableView.reloadData()
    }

    func registerCells() {
        let tvShowCellClassName = String(describing: TVShowCell.self)
        tableView.register(UINib(nibName: tvShowCellClassName, bundle: nil), forCellReuseIdentifier: tvShowCellClassName)
    }
}

extension TVShowListViewController: TVShowListViewInput {

    func reloadData() {

    }

    func setNoResultsStatusDisplayed(_ displayed: Bool) {

    }
}
