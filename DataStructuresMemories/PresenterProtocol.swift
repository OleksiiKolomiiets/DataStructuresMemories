//
//  PresenterProtocol.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/23/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

protocol PresenterProtocol {
    var link: String? { get set }
    var url: URL? { get }
}

extension PresenterProtocol {
    var url: URL? {
        if let link = self.link {
            return URL(string: link)
        } else {
            return nil
        }
    }
}
