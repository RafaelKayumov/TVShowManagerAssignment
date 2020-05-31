//
//  TVShowListViewController.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 29/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import UIKit

private let kNoResultsCellIdentifier = "NoResultsCellIdentifier"
private let kNoResultsCellNibName = "NoResultsCell"

class TVShowListViewController: UITableViewController {

    private var models: [TVShowViewModel]? {
        didSet {
            self.tableView.reloadData()
        }
    }

    var router: Router?
    var output: TVShowListViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        output.onViewReady()

        tableView.allowsSelection = false
    }
}

extension TVShowListViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard models?.isEmpty == false else {
            return tableView.dequeueReusableCell(withIdentifier: kNoResultsCellIdentifier, for: indexPath)
        }

        let index = indexPath.row
        guard
            models?.indices.contains(index) == true,
            let model = models?[index]
        else { return UITableViewCell() }

        let cellIdentifier = String(describing: TVShowCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let tvShowCell = cell as? TVShowCell
        tvShowCell?.viewModel = model

        return cell
    }
}

private extension TVShowListViewController {

    func reloadTableData() {
        tableView.reloadData()
    }

    func registerCells() {
        let tvShowCellClassName = String(describing: TVShowCell.self)
        tableView.register(UINib(nibName: tvShowCellClassName, bundle: nil), forCellReuseIdentifier: tvShowCellClassName)
        tableView.register(UINib(nibName: kNoResultsCellNibName, bundle: nil), forCellReuseIdentifier: kNoResultsCellIdentifier)
    }
}

extension TVShowListViewController: TVShowListViewInput {

    func consumeModels(_ models: [TVShowViewModel]) {
        self.models = models
    }
}
