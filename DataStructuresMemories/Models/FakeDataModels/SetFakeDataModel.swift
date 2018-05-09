//
//  SetFakeDataModel.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 5/5/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

struct SetFakeDataModel: FakeDataProtocol {
    mutating func add(element: Int) {
        dataHolder.insert(element, at: 0)
    }
    
    func delete() {
        
    }
    
    func highlight(by index: Int) {
        
    }
    
    var dataHolder = [Int]()
    var deletedIndex: Int {
        return 0
    }
    var addedIndex: Int {
        return dataHolder.count
    }    
}
