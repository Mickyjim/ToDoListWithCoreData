//
//  CoreDataStack.swift
//  ToDoListWithCoreData
//
//  Created by Sebastien Bastide on 02/08/2019.
//  Copyright © 2019 Sebastien Bastide. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {

    // MARK: - Properties

    private let modelName: String

    // MARK: - Initializer

    init(modelName: String) {
        self.modelName = modelName
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    lazy var mainContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()

    func saveContext() {
        guard mainContext.hasChanges else { return }
        do {
            try mainContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
}

