//
//  DequeueFakeDataModel.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 5/5/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class DequeueFakeDataModel: FakeDataProtocol {
    func add(element: Int) {
        
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
        return 0
    }
    
}
