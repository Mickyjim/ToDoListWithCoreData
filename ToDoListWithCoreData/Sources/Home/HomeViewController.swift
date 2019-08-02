//
//  HomeViewController.swift
//  ToDoListWithCoreData
//
//  Created by Sebastien Bastide on 02/08/2019.
//  Copyright © 2019 Sebastien Bastide. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var tasksTableView: UITableView! { didSet{ tasksTableView.tableFooterView = UIView() } }

    // MARK: - Properties

    private var tasks: [String] = ["Task 1", "Task 2"]

    // MARK: - Actions

    @IBAction private func addButtonTapped(_ sender: UIBarButtonItem) {}

    @IBAction private func resetButtonTapped(_ sender: UIBarButtonItem) {}
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let taskCell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        taskCell.textLabel?.text = tasks[indexPath.row]
        return taskCell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Add some tasks in the list"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tasks.isEmpty ? 200 : 0
    }
}
