//
//  CoreDataManager.swift
//  ToDoListWithCoreData
//
//  Created by Sebastien Bastide on 02/08/2019.
//  Copyright © 2019 Sebastien Bastide. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataManager {

    // MARK: - Properties

    private let coreDataStack: CoreDataStack
    private let managedObjectContext: NSManagedObjectContext

    var tasks: [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        guard let tasks = try? managedObjectContext.fetch(request) else { return [] }
        return tasks
    }

    // MARK: - Initializer

    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
        self.managedObjectContext = coreDataStack.mainContext
    }

    // MARK: - Manage Task Entity

    func createTask(name: String) {
        let task = Task(context: managedObjectContext)
        task.name = name
        coreDataStack.saveContext()
    }

    func deleteAllTasks() {
        tasks.forEach { managedObjectContext.delete($0) }
        coreDataStack.saveContext()
    }
}

