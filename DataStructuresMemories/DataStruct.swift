//
//  DataStruct.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/13/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

protocol DataStruct {
    var sourceOfDataStructuresNames: [String] {get}
    
    func getNameOfDataStructureMemorise(at index: Int) -> String
    func getAmountOfRows() -> Int
}
