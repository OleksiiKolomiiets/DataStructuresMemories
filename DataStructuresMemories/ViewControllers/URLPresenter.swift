//
//  URLPresenter.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/20/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class URLPresenterManager: URLPresenterProtocol {
   
    var presenter: PresentersType?
    
    func setPresenter(by index: Int) {
        presenter = titlesOfType[index]
    }
    
    var amountOfPresenters:  Int {
        return titlesOfType.count
    }
    
    func getTitleOfPresenter() -> String {
        if let presenter = presenter {
            return presenter.rawValue
        } else {
            return "No title"
        }
    }
    
    func getStyleOfPresenter() -> UIAlertActionStyle {
        if let presenter = presenter {
            return presenter.styleForType
        } else {
            return UIAlertActionStyle.destructive
        }
    }
    
    func getAtcion(by controller: DetailViewController, with type: PresentersType) -> () -> Void {
        return {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            switch type {
            case .Cancel:
                break
            default:
                guard var targetController = mainStoryboard.instantiateViewController(withIdentifier: type.rawValue) as? PresenterProtocol else { return }
                targetController.link = controller.tappedCell?.link
                controller.navigationController?.present(targetController as! UIViewController, animated: true)
            }
        }
    }
}

private let titlesOfType: [PresentersType] = [
    .SFSafary,
    .UIWebView,
    .WKWebView,
    .Cancel
]

enum PresentersType: String {
    case UIWebView, WKWebView, SFSafary, Cancel
    
    var styleForType: UIAlertActionStyle {
        switch self {
        case .SFSafary, .UIWebView, .WKWebView:
            return .default
        case .Cancel:
            return .cancel
        }
    }
}
