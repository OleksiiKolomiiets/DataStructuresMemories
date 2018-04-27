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

    @IBOutlet weak var containerForControlls: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = titleOfController {
            self.navigationItem.title = "Visual of \(title)"
        }
        
        var controlManager = ATDControlManager(for: .stack)
        
        addControls(controlManager.createMenu(), view: containerForControlls)
        
        print(controlManager.createMenu())
        
//        let popButton = createButton(named: "POP")
//        containerForControlls.addArrangedSubview(popButton)
//
//        let pushButton = createButton(named: "PUSH")
//        containerForControlls.addArrangedSubview(pushButton)
        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected objec.normat to the new view controller.
    }
    */
    
    
    
    func addControls(_ button: [TypeButton], view: UIStackView) {
        for index in 0..<button.count {
            let button = UIButton.getButtonByType(button[index])
            view.addArrangedSubview(button)
        }
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




