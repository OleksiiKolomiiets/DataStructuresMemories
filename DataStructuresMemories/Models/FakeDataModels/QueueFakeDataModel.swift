//
//  QueueFakeDataModel.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 5/4/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

struct QueueFakeDataModel: FakeDataProtocol {
    
    var dataHolder = [Int]()
    var deletedIndex: Int {
        return 0
    }
    var addedIndex: Int {
        return 0
    }
        
    mutating func add(element: Int) {
        dataHolder.insert(element, at: 0)
    }
    
    mutating func delete() {
        if dataHolder.count > 0 {
            dataHolder.remove(at: 0)
        }
    }
    
    func highlight(by index: Int) {
        
    }
        
}
