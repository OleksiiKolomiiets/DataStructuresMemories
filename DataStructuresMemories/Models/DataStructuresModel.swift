//
//  DataStructModel.swift
//  DataStructures
//
//  Created by Oleksii Kolomiiets on 4/13/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class DataStructuresModel: DataStruct {
    init(_ indexOfName: Int) {
        if let dataStruct = DataStructuresNames(rawValue: indexOfName) {
            currentDataStruct = dataStruct
        }
    }
    var currentDataStruct: DataStructuresNames?
    
    enum DataStructuresNames: Int {
        case stack = 0, queue, set, dequeue, priorityQueue, listArray, multiSet, dictionary
        
        static var countOfNames: Int {
            var max = 0
            while let _ = DataStructuresNames(rawValue: max) {
                max += 1
            }
            return max
        }
        
        var name: String {
            switch self {
            case .stack:
                return "Stack"
            case .queue:
                return "Queue"
            case .set:
                return "Set"
            case .dequeue:
                return "Dequeue"
            case .priorityQueue:
                return "PriorityQueue"
            case .listArray:
                return "List(Array)"
            case .multiSet:
                return "MultiSet"
            case .dictionary:
                return "Dictionary"
            }
        }
        
        var description: String {
            return "simple info about \(self.name)"
        }
    }
    
    func getNameOfDataStructureMemorise(at index: Int) -> String {
        guard let currentDataStructurName = DataStructuresNames(rawValue: index) else {
             fatalError("Index: \(index) does not match the raw value of: DataStructuresNames")
        }
        return currentDataStructurName.name
    }
    
    func getAmountOfRows() -> Int {
        return DataStructuresNames.countOfNames
    }
    
    func getDescription(of structure: String) -> String {
        guard let currentDataStruct = DataStructuresNames(rawValue: getCurrentIndex(of: structure))
        else {
            fatalError("Name: \(structure) does not match any name of: DataStructuresNames")
        }
        return currentDataStruct.description
    }
    
    func getCurrentIndex(of name: String) -> Int {
        var index = 0
        while let currentName = DataStructuresNames(rawValue: index) {
            if currentName.name == name {
                return index
            }
            index += 1
        }
        return -1
    }
    
    
    
}
