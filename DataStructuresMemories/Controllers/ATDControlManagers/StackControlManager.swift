//
//  StackControlManager.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

class StackControlManager: ATDControlProtocol {
    
    var delegate: FakeDataProtocol?
    
    func createMenu() -> [ControlType] {
        return setOfControll
    }
    
    private var setOfControls: [ControlType] {
        return DataType.stack.controlsSet
    }
    
    var model = StackFakeDataModel()
   
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
