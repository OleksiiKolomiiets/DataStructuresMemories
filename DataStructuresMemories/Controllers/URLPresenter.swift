//
//  URLPresenter.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/20/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class URLPresenterManager: URLPresenterProtocol {
   
    var currentPresenter: PresenterType?
    
    func setPresenter(at index: Int) {
        currentPresenter = titlesOfType[index]
    }
    
    var amountOfPresenters:  Int {
        return titlesOfType.count
    }
    
    var titleOfPresenter: String {
        if let presenter = currentPresenter {
            return presenter.rawValue
        } else {
            return "No title"
        }
    }
    
    var styleOfPresenter: UIAlertActionStyle {
        if let presenter = currentPresenter {
            return presenter.alertActionStyle
        } else {
            return UIAlertActionStyle.destructive
        }
    }
    
    func getAction(by controller: DetailViewController, with type: PresenterType) -> () -> Void {
        return {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            switch type {
            case .Cancel:
                break
            default:
                guard var targetController = mainStoryboard.instantiateViewController(withIdentifier: type.rawValue) as? PresenterProtocol else { return }
                targetController.link = controller.selectedDataType?.link
                controller.navigationController?.present(targetController as! UIViewController, animated: true)
            }
        }
    }
}

private let titlesOfType: [PresenterType] = [
    .SFSafary,
    .UIWebView,
    .WKWebView,
    .Cancel
]

enum PresenterType: String {
    case UIWebView, WKWebView, SFSafary, Cancel
    
    var alertActionStyle: UIAlertActionStyle {
        switch self {
        case .SFSafary, .UIWebView, .WKWebView:
            return .default
        case .Cancel:
            return .cancel
        }
    }
}
