//
//  QueueControlManager.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class QueueControlManager: ATDControlProtocol {
    
    var delegate: FakeDataProtocol?
    
    func createMenu() -> [ControlType] {
        return setOfControls
    }
    
    private var setOfControls: [ControlType] {
        return DataType.queue.controlsSet
    }
    
    var model = QueueFakeDataModel()
    
    var setOfControll: [ControlType] {
        return [
            .button(
                .push("PUSH", {
                    self.model.add(element: 1); self.delegate?.add(element: 1)
                    
                })),
            .button(.pop("POP", {}))
        ]
    }
}
