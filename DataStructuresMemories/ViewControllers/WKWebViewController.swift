//
//  WKWebViewController.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/21/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController, WKNavigationDelegate, PresenterProtocol {

   
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        
    }
    
    var link: String?
    
    var url: URL {
        return URL(string: link!)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("WKWeb")
        webView.load(URLRequest(url: url))
//        webView.allowsBackForwardNavigationGestures = true
//        webView.goForward()
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
