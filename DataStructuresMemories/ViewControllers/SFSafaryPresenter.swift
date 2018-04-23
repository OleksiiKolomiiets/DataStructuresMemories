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
        print("Safary")
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
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        isDone = true
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
