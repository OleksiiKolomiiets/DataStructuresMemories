//
//  DequeueControlManager.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class DequeueControlManager: ATDControlProtocol {
    func createMenu() -> [ControlType] {
        return setOfControls
    }
    
    private var setOfControls: [ControlType] {
        return DataType.dequeue.controlsSet
    }
}
