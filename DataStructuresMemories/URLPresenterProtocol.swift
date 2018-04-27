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
    func setPresenter(at index: Int)
    var amountOfPresenters: Int { get }
    var titleOfPresenter: String { get }
    var styleOfPresenter: UIAlertActionStyle { get }
    func getAction(by controller: DetailViewController, with type: PresenterType) -> () -> Void 
}


