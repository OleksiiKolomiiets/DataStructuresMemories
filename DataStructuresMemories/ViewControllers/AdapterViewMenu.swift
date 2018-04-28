//
//  AdapterViewMenu.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/27/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class AdapterViewMenu: NSObject, ControlsAdapterProtocol {
        
    func place(_ elements: [TypeButton], in view: MenuViewProtocol) {
        elements.forEach { view.put(createButtonByType($0)) }
    }
    
    private func addControls(_ button: [TypeButton], view: UIStackView) {
        button.forEach { view.addArrangedSubview(createButtonByType($0)) }
    }
    
    private func createButtonByType(_ type: TypeButton ) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 64))
        button.backgroundColor = UIColor.green
        button.setTitle(type.buttonTitle, for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector( a ), for: .touchUpInside)
        return button
    }

    @objc func a() { print(123) }
}
