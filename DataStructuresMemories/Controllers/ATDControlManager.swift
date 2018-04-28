//
//  ControllManager.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/26/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation


class ATDControlManager: ATDControlProtocol {
    
    init(for type: DataType) {
        typeOfDataStruct = type
    }
    
    var typeOfDataStruct: DataType
    
    func createMenu() -> [TypeButton] {
        return typeOfDataStruct.controlsSet.map { $0 }
    }
    
}

enum DataType: String {
    case stack, queue, set, dequeue, priorityqueue, listarray, multiset, dictionary
    
    var controlsSet: [TypeButton] {
        switch self {
        case .stack, .queue, .dequeue:
            return [.pop("POP"), .push("PUSH")]
        case .set, .priorityQueue, .listArray, .multiSet, .dictionary:
            return [.pop("POP"), .push("PUSH"), .test("TEST")]
        }
    }
}

enum TypeButton {
    case pop(String)
    case push(String)
    case test(String)
    
    var buttonTitle: String {
        switch self {
        case .pop(let title), .push(let title), .test(let title):
            return title
        }
    }
}
