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
    

//    let webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print("UIWEB")
        let url = NSURL (string: link!);
        let request = URLRequest(url: url! as URL);
        webView.loadRequest(request);
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var webView: UIWebView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
