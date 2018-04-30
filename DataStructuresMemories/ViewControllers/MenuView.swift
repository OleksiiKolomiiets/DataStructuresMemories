//
//  MenuView.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/28/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class MenuView: UIStackView, MenuViewProtocol {
    
    func put(_ element: UIView) {
        self.addArrangedSubview(element)
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
