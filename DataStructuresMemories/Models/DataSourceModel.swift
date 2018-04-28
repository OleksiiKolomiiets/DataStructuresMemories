//
//  DataStructModel.swift
//  DataStructures
//
//  Created by Oleksii Kolomiiets on 4/13/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class DataSourceModel: DataSource {
    
    func getDataStructure(_ dataStructure: DataStructure) -> DataStructEntity {
       return DataStructEntity(with: dataStructure.titleOfDataSturct, description: dataStructure.description, link: dataStructure.link)
    }
    
    func getNameOfDataStructureMemorise(at index: Int) -> String {
        guard let currentDataStructurName = DataStructure(rawValue: index) else {
            return "DataStructuresNames with raw value: \(index) has no title."
        }
        return currentDataStructurName.titleOfDataSturct
    }
    
    func getAmountOfRows() -> Int {
        return DataStructure.countOfNames
    }
    
    func getDescription(of structure: String) -> String {
        guard let currentDataStruct = DataStructure(rawValue: getCurrentIndex(of: structure))
        else {
            return "Error. No description for this : \(getCurrentIndex(of: structure))."
        }
        return currentDataStruct.description
    }
    
    func getCurrentIndex(of name: String) -> Int {
        var index = 0
        while let currentName = DataStructure(rawValue: index) {
            if currentName.titleOfDataSturct == name {
                return index
            }
            index += 1
        }
        return -1
    }
    
}
enum DataStructure: Int {
    case stack = 0, queue, set, dequeue, priorityQueue, listArray, multiSet, dictionary
    
    static var countOfNames: Int {
        var max = 0
        while let _ = DataStructure(rawValue: max) {
            max += 1
        }
        return max
    }
    
    var dataStructIndex: Int {
        return self.rawValue
    }
    
    var titleOfDataSturct: String {
        return dataStructNames[self.rawValue]
    }
    
    var description: String {
        return dataStructDescriptionsSource[self.rawValue]
    }
    
    var link: String {
        return dataStructLinks[self.rawValue]
    }
}

let dataStructNames = [ "Stack", "Queue", "Set", "Dequeue", "PriorityQueue", "ListArray", "MultiSet", "Dictionary" ]

let dataStructLinks = [
    "https://en.wikipedia.org/wiki/Stack_(abstract_data_type)",
    "https://en.wikipedia.org/wiki/Queue_(abstract_data_type)",
    "https://en.wikipedia.org/wiki/Set_(abstract_data_type)",
    "https://en.wikipedia.org/wiki/Double-ended_queue",
    "https://en.wikipedia.org/wiki/Priority_queue",
    "https://en.wikipedia.org/wiki/Dynamic_array",
    "https://en.wikipedia.org/wiki/Multiset",
    "https://en.wikipedia.org/wiki/Associative_array"
]
