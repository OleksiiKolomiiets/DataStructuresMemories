//
//  DataStructViewController.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/13/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textInsideLable: UILabel!
    
    var selectedDataType: DataStructProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = selectedDataType?.title {
            self.navigationItem.title = title
        }
        textInsideLable?.text = selectedDataType?.descr
        gradientView.addOpacityGradient()
    }
    
    @IBOutlet weak var gradientView: UIView!
    
    var isTextShrinked = true {
        didSet {
            let title = isTextShrinked ? "More" : "Less"
            let priorityForShrink = isTextShrinked ? UILayoutPriority(250) : UILayoutPriority(999)
            let priorityForUnShrink = isTextShrinked ? UILayoutPriority(999) : UILayoutPriority(250)
            UIView.transition(
                with: viewWithDataStructDetailes,
                duration: 0.3,
                options: [.transitionFlipFromTop],
                animations: { [ weak self ]  in
                    guard let strongSelf = self else { return }
                    strongSelf.toggleButton.setTitleForAllStates(using: title)
                    strongSelf.wikiButton.isHidden.toggle()
                    strongSelf.gradientView.isHidden.toggle()
                    strongSelf.constraintToHeight.priority = priorityForUnShrink
                    strongSelf.gradientView.updateConstraints()
                }
            )
            trailingToggleButtonConstraint.priority = priorityForShrink
            leadingButtonConstraint.priority = priorityForShrink
            centreXToggleButtonConstraint.priority = priorityForUnShrink
        }
    }
    @IBAction func touchWikiButton(_ sender: UIButton) {
        presentWaysToOpenLink()
    }
    
    @IBAction func touchMoreButton(_ sender: UIButton) {
        isTextShrinked.toggle()
    }
    
    @IBOutlet weak var trailingToggleButtonConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leadingButtonConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var centreXToggleButtonConstraint: NSLayoutConstraint!

    @IBAction func tappedVisualisationButton(_ sender: UIButton) {
        pushVisulizationControllerInStack()
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var viewWithDataStructDetailes: UIView!
    
    @IBOutlet weak var toggleButton: UIButton!
    
    @IBOutlet weak var constraintToHeight: NSLayoutConstraint!

    @IBOutlet weak var wikiButton: UIButton!
    
    func presentWaysToOpenLink() {
        let waysToOpenWikiLink = UIAlertController(
            title: "Links To Wikipedia",
            message: "Choose the way to open wikipedia page with more information.",
            preferredStyle: .actionSheet
        )
        
        let presenterManager = URLPresenterManager()
        
        for index in 0 ..< presenterManager.amountOfPresenters {

            
            presenterManager.setPresenter(at: index)
            let cuurentPresenter = presenterManager.currentPresenter!
            waysToOpenWikiLink.addAction(UIAlertAction(
                title: presenterManager.titleOfPresenter,
                style: presenterManager.styleOfPresenter,
                handler:  { action in
                    presenterManager.getAction(by: self, with: cuurentPresenter)()
            }
            ))
        }
        present(waysToOpenWikiLink, animated: true, completion: nil)
    }
    func pushVisulizationControllerInStack() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let visualVC = storyboard.instantiateViewController(withIdentifier: "IdVisualVC") as? VisualizationViewController else { return }
        visualVC.titleOfController = selectedDataType?.title
        self.navigationController?.pushViewController(visualVC, animated: true)
        
    }
}

extension UIView {
    func addOpacityGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 1.0]
        self.layer.mask = gradient
    }
}

extension UIButton {
    func setTitleForAllStates(using newTitle: String) {
        self.setTitle(newTitle, for: UIControlState.normal)
        self.setTitle(newTitle, for: UIControlState.selected)
        self.setTitle(newTitle, for: UIControlState.highlighted)
        self.setTitle(newTitle, for: UIControlState.disabled)
    }
}

extension Bool {
    mutating func toggle() {
        self = !self
    }
}
