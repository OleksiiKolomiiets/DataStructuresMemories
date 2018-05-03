//
//  AdapterViewMenu.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/27/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class AdapterViewMenu: NSObject, ControlsAdapterProtocol {
    
    weak var fakeDataDelegate: FakeDataTableViewController?
    
    func place(_ elements: [ControlType], in view: MenuViewProtocol) {
        elements.forEach { view.put(createControlItem($0)) }
    }
    
    private func addControls(_ button: [ControlType], view: UIStackView) {
        button.forEach { view.addArrangedSubview(createControlItem($0)) }
    }
    
    private func createControlItem(_ type: ControlType ) -> UIView {
        if let fakeDataDelegate = fakeDataDelegate {
            switch type {
            case .button(.pop(let title, _)):
                return ButtonWithAction(title: title, action: { fakeDataDelegate.delete() })
            case .button(.push(let title, _)):
                return ButtonWithAction(title: title, action: { fakeDataDelegate.add(element: 0) })
            case .textFeild(let type):
                return createTextFeildByType(type)
            case .horizontalStackView(.title(let title), TextFeildType.value(let placeholder)):
                return createVerticalStack(with: title, placeholder: placeholder)
            case .horizontalStackView(_, .key(_)):
                return UITextField() // ToDo
            }
        } else {
            return UIView(frame: .zero)
        }
    }
    
    private func createVerticalStack(with title: String, placeholder: String) -> UIStackView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let textFeild = UITextField(frame: CGRect(x: 0, y: 0, width: 20, height: 200))
        let container = UIStackView(arrangedSubviews: [label, textFeild])
        
        container.distribution = .fillProportionally
        container.axis = .vertical
        
        textFeild.textAlignment = .center
        textFeild.keyboardAppearance = .dark
        textFeild.keyboardType = .asciiCapable
    
        label.text = title
        label.textAlignment = .center
        label.layoutMargins = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        label.font = UIFont(name: "Helvetica", size: 14.0)
        
        
        return container
    }
    
    private func createTextFeildByType(_ type: TextFeildType ) -> UITextField {
        return UITextField()
    }
}
