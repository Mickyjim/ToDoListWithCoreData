//
//  CoreDataManager.swift
//  ToDoListWithCoreDataTests
//
//  Created by Sebastien Bastide on 02/08/2019.
//  Copyright © 2019 Sebastien Bastide. All rights reserved.
//

@testable import ToDoListWithCoreData
import XCTest

final class CoreDataManagerTests: XCTestCase {

    // MARK: - Properties

    var coreDataStack: MockCoreDataStack!
    var coreDataManager: CoreDataManager!

    //MARK: - Tests Life Cycle

    override func setUp() {
        super.setUp()
        coreDataStack = MockCoreDataStack()
        coreDataManager = CoreDataManager(coreDataStack: coreDataStack)
    }

    override func tearDown() {
        super.tearDown()
        coreDataManager = nil
        coreDataStack = nil
    }

    // MARK: - Tests

    func testAddTeskMethods_WhenAnEntityIsCreated_ThenShouldBeCorrectlySaved() {
        coreDataManager.createTask(name: "My Task")
        XCTAssertTrue(!coreDataManager.tasks.isEmpty)
        XCTAssertTrue(coreDataManager.tasks.count == 1)
        XCTAssertTrue(coreDataManager.tasks[0].name! == "My Task")
    }

    func testDeleteAllTasksMethod_WhenAnEntityIsCreated_ThenShouldBeCorrectlyDeleted() {
        coreDataManager.createTask(name: "My Task")
        coreDataManager.deleteAllTasks()
        XCTAssertTrue(coreDataManager.tasks.isEmpty)
    }
}
