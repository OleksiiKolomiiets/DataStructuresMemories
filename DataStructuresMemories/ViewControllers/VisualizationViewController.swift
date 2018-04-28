//
//  VisualizationViewController.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/26/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class VisualizationViewController: UIViewController {
    
    var embededController: FakeDataTableViewController?
    var titleOfController: String!

    @IBOutlet weak var containerForControlls: MenuView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Visual of \(titleOfController)"
        let structName = titleOfController.lowercased()
        if let tupeOfData = DataType(rawValue: structName) {
            let controlManager = ATDControlManager(for: tupeOfData)
            let menu = controlManager.createMenu()
            let adapterForControlsElement = AdapterViewMenu()
            adapterForControlsElement.place(menu, in: containerForControlls)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let targetController = segue.destination as? FakeDataTableViewController {
            self.embededController = targetController
            targetController.numberOfRows = 0
        }
    }

}




