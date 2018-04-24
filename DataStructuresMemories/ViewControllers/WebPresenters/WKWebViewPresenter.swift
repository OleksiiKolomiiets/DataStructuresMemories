//
//  WKWebViewController.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/21/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewPresenter: UIViewController, WKNavigationDelegate, PresenterProtocol {
   
    var webView: WKWebView!
    
    @IBOutlet weak var containerView: WKWebView!
  
    @IBAction func tocuhBackButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    var link: String?
    
    var url: URL? {
        if let link = link {
            return URL(string: link)
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = url {
            webView.load(URLRequest(url: url))
        }
    }
    
    override func loadView() {
        super.loadView()
        webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        webView.frame = containerView.frame
        containerView.addSubview(webView)
    }
    
}
