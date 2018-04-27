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
    
    var tappedCell: DataStructProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = tappedCell?.title {
            self.navigationItem.title = title
        }
        textInsideLable?.text = tappedCell?.descr
        gradientView.opacityGradient()
    }
    
    @IBOutlet weak var gradientView: UIView!
    
    var isTextShrinked = true {
        didSet {
            let title = isTextShrinked ? "More" : "Less"
            let priorityForShrink = isTextShrinked ? UILayoutPriority(250) : UILayoutPriority(999)
            let priorityForUnShrink = isTextShrinked ? UILayoutPriority(999) : UILayoutPriority(250)
            UIView.transition(
                with: childView,
                duration: 0.3,
                options: [.transitionFlipFromTop],
                animations: { [ weak self ]  in
                    self?.toggleButton.setTitleForAllStates(using: title)
                    self?.wikiButton.isHidden = !(self?.wikiButton.isHidden)!
                    self?.gradientView.isHidden = !(self?.gradientView.isHidden)!
                    self?.constraintToHeight.priority = priorityForUnShrink
                    self?.gradientView.updateConstraints()
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
        isTextShrinked = !isTextShrinked
    }
    
    @IBOutlet weak var trailingToggleButtonConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leadingButtonConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var centreXToggleButtonConstraint: NSLayoutConstraint!

    @IBAction func tappedVisualisationButton(_ sender: UIButton) {
        pushVisulizationControllerInStack()
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var childView: UIView!
    
    @IBOutlet var parentView: UIView!
    
    @IBOutlet weak var toggleButton: UIButton!
    
    @IBOutlet weak var constraintToHeight: NSLayoutConstraint!

    @IBOutlet weak var wikiButton: UIButton!
    
    func presentWaysToOpenLink() {
        let waysToOpenWikiLink = UIAlertController(
            title: "Links To Wikipedia",
            message: "Choose the way to open wikipedia page with more information.",
            preferredStyle: .actionSheet
        )
        
        let presenter = URLPresenterManager()
        
        for index in 0 ..< presenter.amountOfPresenters {

            
            presenter.setPresenter(by: index)
            let cuurentPresenter = presenter.presenter!
            waysToOpenWikiLink.addAction(UIAlertAction(
                title: presenter.getTitleOfPresenter(),
                style: presenter.getStyleOfPresenter(),
                handler:  { action in
                    presenter.getAtcion(by: self, with: cuurentPresenter)()
            }
            ))
        }
        present(waysToOpenWikiLink, animated: true, completion: nil)
    }
    func pushVisulizationControllerInStack() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let visualVC = storyboard.instantiateViewController(withIdentifier: "IdVisualVC") as? VisualizationViewController else { return }
        visualVC.titleOfController = tappedCell?.title
        self.navigationController?.pushViewController(visualVC, animated: true)
        
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

extension UIButton {
    func setTitleForAllStates(using newTitle: String) {
        self.setTitle(newTitle, for: UIControlState.normal)
        self.setTitle(newTitle, for: UIControlState.selected)
        self.setTitle(newTitle, for: UIControlState.focused)
        self.setTitle(newTitle, for: UIControlState.disabled)
    }
}
