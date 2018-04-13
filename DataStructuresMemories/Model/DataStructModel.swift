//
//  DataStructModel.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/13/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class DataStructModel: DataStruct {
    var sourceOfDataStructuresNames: [String] {
        return ["Stack", "Queue", "Set", "Dequeue", "PriorityQueue", "List(Array)", "MultiSet", "Dictionary"]
    }
    
    func getNameOfDataStructureMemorise(at index: Int) -> String {
        return sourceOfDataStructuresNames[index]
    }
    
    func getAmountOfRows() -> Int {
        return sourceOfDataStructuresNames.count
    }
    
}
