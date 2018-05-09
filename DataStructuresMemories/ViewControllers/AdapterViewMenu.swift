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
    var typeOfData: DataType?
    var fakeDataModel: DataModelFactoryProtocol?
    
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
                return createTextFeildByType(type, action: { (s1: String) -> Void in fakeDataDelegate.add(element: 2) } )
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
        let textFeild = UITextField(frame: CGRect(x: 0, y: 0, width: 20, height: 200))
        textFeild.textAlignment = .center
        textFeild.keyboardAppearance = .dark
        textFeild.keyboardType = .asciiCapable
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        label.text = title
        label.textAlignment = .center
        label.layoutMargins = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        label.font = UIFont(name: "Helvetica", size: 14.0)
        
        let container = UIStackView(arrangedSubviews: [label, textFeild])
        container.distribution = .fillProportionally
        container.axis = .vertical
        
        return container
    }
    
    private func createTextFeildByType(_ type: TextFeildType, action: ((String)->())? ) -> UITextField {
        return CustomTextFeild(placeholder: type.placeholder, keyboardType: .numberPad, action: action)
//        return UITextField()
    }
}
