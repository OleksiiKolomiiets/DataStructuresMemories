//
//  CustomTableViewCell.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/13/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var labelOfCell: UILabel!
}

extension CustomTableViewCell: ConfigurableCell {
    func configure(_ model: DataStruct) {
        self.labelOfCell.text = model.title
    }
}


