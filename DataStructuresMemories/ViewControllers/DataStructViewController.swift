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
    
    var tappedCell: DataStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = tappedCell?.title
        textInsideLable?.text = tappedCell?.descr
        gradientView.opacityGradient()
    }
    
    @IBOutlet weak var gradientView: UIView!
    
    
    @IBAction func touchMoreButton(_ sender: UIButton) {
        print("more")
        gradientView.isHidden = true
        lessInformationButton.isHidden = false
        constraintToHeight.priority = UILayoutPriority(250)
//        parentView.co
    }
    
    @IBOutlet weak var heightConstrains: NSLayoutConstraint!
    
    @IBOutlet weak var childView: UIView!
    @IBOutlet var parentView: UIView!
    
    @IBOutlet weak var moreInformationButton: UIButton!
    
    @IBOutlet weak var constraintToHeight: NSLayoutConstraint!
    
    @IBOutlet weak var lessInformationButton: UIButton!
    
    @IBAction func touchLessButton(_ sender: UIButton) {
        print(gradientView.isHidden)
        gradientView.isHidden = false
        lessInformationButton.isHidden = true
        
        constraintToHeight.priority = UILayoutPriority(999)
    }
    
}

extension UIView {
    func opacityGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 1.0]
        self.layer.mask = gradient
    }
}
