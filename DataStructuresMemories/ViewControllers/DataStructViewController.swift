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
    
    var tappedCell: DataStructProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = tappedCell?.title
        textInsideLable?.text = tappedCell?.descr
        gradientView.opacityGradient()
    }
    
    @IBOutlet weak var gradientView: UIView!
    
    var isTextShrinked = true {
        didSet {
            let title = isTextShrinked ? "More" : "Less"
            UIView.transition(with: scrollView,
                              duration: 0.3,
                              options: [.transitionFlipFromTop],
                              animations: {
                                self.toggleButton.changeTitle(to: title)
                                }
            )
            gradientView.isHidden = !gradientView.isHidden
            constraintToHeight.priority = isTextShrinked ? UILayoutPriority(999) : UILayoutPriority(250)
            gradientView.updateConstraints()
        }
    }
    
    @IBAction func touchMoreButton(_ sender: UIButton) {
        isTextShrinked = !isTextShrinked
//        gradientView.isHidden = true
//        constraintToHeight.priority = UILayoutPriority(250)
//        gradientView.updateConstraints()
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var heightConstrains: NSLayoutConstraint!
    
    @IBOutlet weak var childView: UIView!
    @IBOutlet var parentView: UIView!
    
    @IBOutlet weak var toggleButton: UIButton!
    
    @IBOutlet weak var constraintToHeight: NSLayoutConstraint!
    
//    @IBOutlet weak var lessInformationButton: UIButton!
//
//    @IBAction func touchLessButton(_ sender: UIButton) {
//        print(gradientView.isHidden)
//        gradientView.isHidden = false
//        lessInformationButton.isHidden = true
//
//        constraintToHeight.priority = UILayoutPriority(999)
//        gradientView.updateConstraints()
//
//        print(constraintToHeight.multiplier)
//    }
//
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

extension UIButton {
    func changeTitle(to newTitle: String) {
        self.setTitle(newTitle, for: UIControlState.normal)
        self.setTitle(newTitle, for: UIControlState.selected)
        self.setTitle(newTitle, for: UIControlState.focused)
        self.setTitle(newTitle, for: UIControlState.disabled)
    }
}
