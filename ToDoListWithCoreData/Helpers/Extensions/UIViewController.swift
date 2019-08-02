//
//  UIViewController.swift
//  ToDoListWithCoreData
//
//  Created by Sebastien Bastide on 02/08/2019.
//  Copyright © 2019 Sebastien Bastide. All rights reserved.
//

import UIKit

extension UIViewController {
    /**
     * Display an alert to enter the task name
     */
    func displayTaskAlert(handlerTaskName: @escaping (String?) -> Void) {
        let alertController = UIAlertController(title: "Add new task", message: "", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Task"
        }
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { _ in
            guard let textField = alertController.textFields else { return }
            handlerTaskName(textField[0].text)
        })
        alertController.addAction(addAction)
        present(alertController, animated: true, completion: nil)
    }
}
