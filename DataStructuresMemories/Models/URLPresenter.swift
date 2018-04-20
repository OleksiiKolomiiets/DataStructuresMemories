//
//  URLPresenter.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/20/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation
import UIKit

class URLPresenterModel: URLPresenterProtocol {
    
    private var presenter: PresentersType?
    
    func setPresenter(by index: Int) {
        presenter = titlesOfType[index]
    }
    
    func getAmountOfPresenters() -> Int {
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
    
    func getAtcion() {
        print(1)
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
    
    var actionForType: () -> () {
        switch self {
        case .SFSafary:
            return someFunc
        case .UIWebView:
            return someFunc
        case .WKWebView:
            return someFunc
        case .Cancel:
            return someFunc
        }
    }
}

func someFunc() {
    
}
