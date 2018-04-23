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
            case .WKWebView:
                guard let targetController = mainStoryboard.instantiateViewController(withIdentifier: type.rawValue) as? WKWebViewController else { return }
                targetController.link = controller.tappedCell?.link
                controller.navigationController?.present(targetController, animated: true)
            case .UIWebView:
                guard let targetController = mainStoryboard.instantiateViewController(withIdentifier: type.rawValue) as? UIWebViewPresenter else { return }
                targetController.link = controller.tappedCell?.link
                controller.navigationController?.present(targetController, animated: true)
            case .SFSafary:
                guard let targetController = mainStoryboard.instantiateViewController(withIdentifier: type.rawValue) as? SFSafaryPresenter else { return }
                targetController.link = controller.tappedCell?.link
                controller.navigationController?.present(targetController, animated: true)
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
    
    var controllerName: () {
        switch self {
        case .SFSafary:
            return someFunc()
        case .UIWebView:
            return someFunc()
        case .WKWebView:
            return someFunc()
        case .Cancel:
            return someFunc()
        }
    }
}

func someFunc() {
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    guard let targetController = mainStoryboard.instantiateViewController(withIdentifier: "WK") as? WKWebViewController else { return }
    guard let detailController = mainStoryboard.instantiateViewController(withIdentifier: "DataStructId") as? DetailViewController else { return }
    guard let link = detailController.tappedCell?.link else { return }
    targetController.link = link
    detailController.navigationController?.present(targetController, animated: true)
}
