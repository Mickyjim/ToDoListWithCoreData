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

    var coreDataManager: CoreDataManager?

    // MARK: - Actions

    @IBAction private func addButtonTapped(_ sender: UIBarButtonItem) {
        displayTaskAlert { [unowned self] taskName in
            guard let taskName = taskName, !taskName.isBlank else { return }
            self.coreDataManager?.createTask(name: taskName)
            self.tasksTableView.reloadData()
        }
    }

    @IBAction private func resetButtonTapped(_ sender: UIBarButtonItem) {
        coreDataManager?.deleteAllTasks()
        tasksTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataManager?.tasks.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let taskCell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        taskCell.textLabel?.text = coreDataManager?.tasks[indexPath.row].name
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
        return coreDataManager?.tasks.isEmpty ?? true ? 200 : 0
    }
}
