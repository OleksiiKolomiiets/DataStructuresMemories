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
    var titleOfController: String?

    @IBOutlet weak var containerForControlls: MenuView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = titleOfController {
            self.navigationItem.title = "Visual of \(title)"
            let structName = title.lowercased()
            if let typeOfData = DataType(rawValue: structName), let menu = ATDControlManager(for: typeOfData).manager?.createMenu() {
                let adapterForControlsElement = AdapterViewMenu()
                adapterForControlsElement.fakeDataDelegate = embededController
                adapterForControlsElement.typeOfData = typeOfData
                
                embededController?.typeOfData = typeOfData
                embededController?.dataModel = DataModelFactory(for: typeOfData).model
                adapterForControlsElement.place(menu, in: containerForControlls)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let targetController = segue.destination as? FakeDataTableViewController {
            self.embededController = targetController
            
        }
    }

}





