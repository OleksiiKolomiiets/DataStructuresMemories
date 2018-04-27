//
//  UIWebViewPresenter.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/21/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class UIWebViewPresenter: UIViewController, PresenterProtocol {
    
    var link: String?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = self.url {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var webView: UIWebView!
    
}
