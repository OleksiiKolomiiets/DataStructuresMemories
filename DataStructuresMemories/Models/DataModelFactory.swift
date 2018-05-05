//
//  DataModelFactory.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 5/3/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class DataModelFactory: DataModelFactoryProtocol {
 
    
    var model: FakeDataProtocol
    
    init(for type: DataType) {
        switch type {
        case .stack:
            self.model = StackFakeDataModel()
        case .queue:
            self.model = QueueFakeDataModel()
        case .set:
            self.model = SetFakeDataModel()
        case .dequeue:
            self.model = DequeueFakeDataModel()
        case .priorityqueue:
            self.model = PriorityFakeDataModel()
        case .listarray:
            self.model = ArrayFakeDataModel()
        case .multiset:
            self.model = MultiSetFakeDataModel()
        case .dictionary:
            self.model = DictionaryFakeDataModel()
        }
    }
    
    
}
