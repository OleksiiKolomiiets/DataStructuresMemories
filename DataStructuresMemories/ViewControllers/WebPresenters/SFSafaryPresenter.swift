//
//  SFSafary.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/23/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import SafariServices

class SFSafaryPresenter: UIViewController, PresenterProtocol, SFSafariViewControllerDelegate {
    
    var link: String?
    
    var isDone = false
    
    @IBOutlet weak var safaryView: UIWebView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if let link = link, let url = URL(string: link) {
            let safariVC = SFSafariViewController(url: url, entersReaderIfAvailable: false)
            safariVC.delegate = self
            
            if isDone {
                dismiss(animated: true)
            } else {
                self.present(safariVC, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        isDone = true
    }

}
