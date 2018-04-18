//
//  DataStructViewController.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/13/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class DataStructViewController: UIViewController {
    
    @IBOutlet weak var textInsideLable: UILabel!
    
    var tappedCell: DataStructModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = tappedCell?.title
        textInsideLable?.text = tappedCell?.descr
    }
}
