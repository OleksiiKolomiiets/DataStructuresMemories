//
//  FakeDataProtocol.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/30/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

protocol FakeDataProtocol {
    func add(element: Int)
    func delete()
    func highlight(by index: Int)
    
    var dataHolder: [Int] { get }
}
