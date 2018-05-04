//
//  StackFakeDataModel.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 5/2/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

struct StackFakeDataModel: FakeDataProtocol {
        
    mutating func add(element: Int) {
        self.dataHolder.append(element)
    }
    
    mutating func delete() {
        if dataHolder.count > 0 {
            dataHolder.remove(at: 0)
            highlightIndex = 0
        }
    }
    
    func highlight(by index: Int) {
        
    }
    
    var getLastItem: Int {
        return dataHolder.last!
    }
    
    var count: Int {
        return dataHolder.count
    }
    
    var dataHolder = [Int]()
    
    var highlightIndex: Int = 0
    
    var deletedIndex: Int {
        return 0
    }
    
    var addedIndex: Int {
        return dataHolder.count
    }
    
    func getDataHolder() -> [Int] {
        return dataHolder
    }
    
}
