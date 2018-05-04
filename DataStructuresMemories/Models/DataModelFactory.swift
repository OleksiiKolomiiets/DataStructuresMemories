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
        default:
            self.model = QueueFakeDataModel()
            
//        case .queue:
//            self.model = QueueControlModel()
//        case .set:
//            self.model = SetControlManager()
//        case .dequeue:
//            self.model = DequeueControlManager()
//        case .priorityqueue:
//            self.model = PriorityQueueControlManager()
//        case .listarray:
//            self.model = ArrayListControlManager()
//        case .multiset:
//            self.model = MultiSetControlManager()
//        case .dictionary:
//            self.model = DictionaryControlManager()
        }
    }
    
    
}
