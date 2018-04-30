//
//  ButtonWithAction.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class ButtonWithAction: UIButton {
    init(title: String, action: (() -> ())? = nil) {
        super.init(frame: .zero)
        
        self.action = action
        self.setTitle(title, for: .normal)
        self.addTarget(self, action: #selector( actionCall ), for: .touchUpInside)
        self.backgroundColor = UIColor.red
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var action: (() -> ())?
    
    @objc func actionCall() {
        action?()
    }
}
