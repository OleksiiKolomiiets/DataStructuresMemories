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
    
    @IBOutlet weak var safaryView: UIWebView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("Safary")
        if let link = link, let url = URL(string: link) {
            let safariVC = SFSafariViewController(url: url, entersReaderIfAvailable: false)
            safariVC.delegate = self
            self.present(safariVC, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
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
