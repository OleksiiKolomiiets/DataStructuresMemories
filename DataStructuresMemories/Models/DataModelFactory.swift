//
//  DataModelFactory.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 5/3/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class DataModelFactory: DataModelFactoryProtocol {
    required init(for dataType: DataType) {
        currentDataType = dataType
        switch dataType {
        case .stack:
            break
//        case .queue:
//            <#code#>
//        case .set:
//            <#code#>
//        case .dequeue:
//            <#code#>
//        case .priorityqueue:
//            <#code#>
//        case .listarray:
//            <#code#>
//        case .multiset:
//            <#code#>
//        case .dictionary:
//            <#code#>
        default:
            break
        }
    }
    
    private var currentDataType: DataType 
    
    
}
