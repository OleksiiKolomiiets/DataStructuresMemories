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

    @IBOutlet weak var containerForControlls: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Visual of \(titleOfController)"
        let controlManager = ATDControlManager(for: .stack)
        let menu = controlManager.createMenu()
        addControls(menu, view: containerForControlls)
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
    
    func addControls(_ button: [TypeButton], view: UIStackView) {
        button.forEach { view.addArrangedSubview(UIButton.getButtonByType($0)) }
    }
    
    @objc func touch() {
        print(1)
    }

}
extension UIButton {
    @objc func a() { print(123) }
    
    static func getButtonByType(_ type: TypeButton ) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 64))
        button.backgroundColor = UIColor.green
        button.setTitle(type.rawValue, for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector( a ), for: .touchUpInside)
        return button
    }
}




