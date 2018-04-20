//
//  URLPresenterProtocol.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/20/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation
import UIKit

protocol URLPresenterProtocol {
    func setPresenter(by index: Int)
    var amountOfPresenters: Int { get }
    func getTitleOfPresenter() -> String
    func getStyleOfPresenter() -> UIAlertActionStyle
    func getAtcion()
}


