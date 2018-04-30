//
//  ControllManager.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/26/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation


class ATDControlManager {
    
    var manager: ATDControlProtocol?
    
    init(for type: DataType) {
        typeOfDataStruct = type
        switch type {
        case .stack:
            self.manager = StackControlManager()
        case .queue:
            self.manager = QueueControlManager()
        case .set:
            self.manager = SetControlManager()
        case .dequeue:
            self.manager = DequeueControlManager()
        case .priorityqueue:
            self.manager = PriorityQueueControlManager()
        case .listarray:
            self.manager = ArrayListControlManager()
        case .multiset:
            self.manager = MultiSetControlManager()
        case .dictionary:
            self.manager = DictionaryControlManager()
        }
    }    
    var typeOfDataStruct: DataType
}

enum DataType: String {
    case stack, queue, set, dequeue, priorityqueue, listarray, multiset, dictionary
    
    var controlsSet: [ControlType] {
        switch self {
        case .stack, .queue, .dequeue:
            return [.button(.pop("POP", {})), .button(.push("PUSH", {}))]
        case .listarray:
            return [.button(.pop("ADD", {})), .button(.push("DELETE", {})), .textFeild(.key("INDEX")), .textFeild(.value("VALUE"))]
        case .priorityqueue:
            return [.button(.pop("POP", {})), .button(.push("PUSH", {})), .textFeild(.key("PRIORITY")), .textFeild(.value("VALUE"))]
        case .set, .multiset:
            return [.button(.pop("POP", {})), .button(.push("PUSH", {})), .textFeild(.key("KEY")), .textFeild(.value("VALUE"))]
        case .dictionary:
            return [.button(.pop("ADD", {})), .button(.push("DELETE", {})), .textFeild(.key("KEY")), .textFeild(.value("VALUE"))]
        }
    }
}

enum ControlType {
    case button(ButtonType)
    case textFeild(TextFeildType)
}

enum TextFeildType {
    case key(String)
    case value(String)
    
    var placeholder: String {
        switch self {
        case .key(let placeholder), .value(let placeholder):
            return placeholder
        }
    }
}

enum ButtonType {
    case pop(String, ()->())
    case push(String, ()->())
    
    var buttonTitle: String {
        switch self {
        case .pop(let title, _), .push(let title, _):
            return title
        }
    }
    
    var action: () -> () {
        switch self {
        case .pop(_):
            return { print("Action for pop") }
        case .push(_):
            return { print("Action for push") }
        }
    }
}
