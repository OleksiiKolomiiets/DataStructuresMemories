//
//  DataStructViewController.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/13/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class DataStructViewController: UIViewController {
    
    @IBOutlet weak var titleOfView: UILabel?
    
    var titleText: String?
    var descriptionOfDataStructure: String?
    var cellNumber: Int?
    
    @IBOutlet weak var displayDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleOfView?.text = titleText
        if let number = cellNumber, let descrioption = descriptionOfDataStructure {
            displayDetail?.text = "\(number): \(descrioption)"
        }
    }
}
