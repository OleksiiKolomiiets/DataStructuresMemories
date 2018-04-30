//
//  AdapterViewMenu.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/27/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class AdapterViewMenu: NSObject, ControlsAdapterProtocol {
        
    func place(_ elements: [ControlType], in view: MenuViewProtocol) {
        elements.forEach { view.put(createControlItem($0)) }
    }
    
    private func addControls(_ button: [ControlType], view: UIStackView) {
        button.forEach { view.addArrangedSubview(createControlItem($0)) }
    }
    
    private func createControlItem(_ type: ControlType ) -> UIView {
        
        switch type {
        case .button(let type):
            return ButtonWithAction(title: type.buttonTitle, action: type.action)
        case .textFeild(let type):
            return createTextFeildByType(type)
        }
    }
    
    private func createTextFeildByType(_ type: TextFeildType ) -> UITextField {
        return UITextField()
    }
}
