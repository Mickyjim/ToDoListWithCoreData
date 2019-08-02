//
//  Array.swift
//  ToDoListWithCoreData
//
//  Created by Sebastien Bastide on 02/08/2019.
//  Copyright © 2019 Sebastien Bastide. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    /**
     * Remove all duplicates elements into an array
     */
    var removeDuplicates: [Element] {
        var addedDict = [Element: Bool]()
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
}
