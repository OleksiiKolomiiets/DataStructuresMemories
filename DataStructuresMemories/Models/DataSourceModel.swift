//
//  DataStructModel.swift
//  DataStructures
//
//  Created by Oleksii Kolomiiets on 4/13/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class DataSourceModel: DataSource {
    func getDataStruct(at index: Int) -> DataStructEntity {
        var dataStruct = DataStructEntity(with: "title", "description", "link")
        if let title = DataStructuresNames(rawValue: index)?.titleOfDataSturct,
            let description = DataStructuresNames(rawValue: index)?.description ,
            let link = DataStructuresNames(rawValue: index)?.link {
             dataStruct = DataStructEntity(with: title, description, link)
        }
        return dataStruct
    }
    
    enum DataStructuresNames: Int {
        case stack = 0, queue, set, dequeue, priorityQueue, listArray, multiSet, dictionary
        
        static var countOfNames: Int {
            var max = 0
            while let _ = DataStructuresNames(rawValue: max) {
                max += 1
            }
            return max
        }
        
        var titleOfDataSturct: String {
            if let dataStructTitle = dataStructTitlesSource[self] {
                return dataStructTitle
            } else {
                return "DataStructuresNames with raw value: \(self.rawValue) has no title."
            }
        }
        
        var description: String {
            if let dataStructDescription = dataStructDescriptionsSource[self] {
                return dataStructDescription
            } else {
                return "DataStructuresNames with raw value: \(self.rawValue) has no description."
            }
        }
        
        var link: String {
            if let dataStructLink = dataStructLinksSource[self] {
                return dataStructLink
            } else {
                return "DataStructuresNames with raw value: \(self.rawValue) has no link."
            }
        }
    }
    
    func getNameOfDataStructureMemorise(at index: Int) -> String {
        guard let currentDataStructurName = DataStructuresNames(rawValue: index) else {
            return "DataStructuresNames with raw value: \(index) has no title."
        }
        return currentDataStructurName.titleOfDataSturct
    }
    
    func getAmountOfRows() -> Int {
        return DataStructuresNames.countOfNames
    }
    
    func getDescription(of structure: String) -> String {
        guard let currentDataStruct = DataStructuresNames(rawValue: getCurrentIndex(of: structure))
        else {
            return "Error. No description for this : \(getCurrentIndex(of: structure))."
        }
        return currentDataStruct.description
    }
    
    func getCurrentIndex(of name: String) -> Int {
        var index = 0
        while let currentName = DataStructuresNames(rawValue: index) {
            if currentName.titleOfDataSturct == name {
                return index
            }
            index += 1
        }
        return -1
    }
    
    
    
}
