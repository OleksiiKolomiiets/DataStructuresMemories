//
//  QueueFakeDataModel.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 5/4/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

struct QueueFakeDataModel: FakeDataProtocol {
    
    var deletedIndex: Int {
        print(1)
        return 0
    }
    
    var addedIndex: Int {
        return 0
    }
    
    
    var count: Int = 0
    
    var highlightIndex: Int = 0
    
    mutating func add(element: Int) {
        
        print(111)
        dataHolder.append(element)
        highlightIndex = dataHolder.count - 1
    }
    
    mutating func delete() {
        if dataHolder.count > 0 {
            dataHolder.remove(at: 0)
            highlightIndex = 0
        }
    }
    
    func highlight(by index: Int) {
        
    }
    
    var dataHolder = [Int]()
    
    func getDataHolder() -> [Int]{
        return dataHolder.reversed()
    }
    
    
}
