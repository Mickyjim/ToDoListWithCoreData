//
//  String.swift
//  ToDoListWithCoreData
//
//  Created by Sebastien Bastide on 02/08/2019.
//  Copyright © 2019 Sebastien Bastide. All rights reserved.
//

import Foundation

extension String {
    /**
     * Check if a string contains at least one element
     */
    var isBlank: Bool {
        return !self.map({ $0.isWhitespace }).removeDuplicates.contains(false)
    }
}
