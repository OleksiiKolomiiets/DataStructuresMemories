//
//  DataStruct.swift
//  DataStructures
//
//  Created by Oleksii Kolomiiets on 4/13/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

protocol DataSource {    
    func getNameOfDataStructureMemorise(at index: Int) -> String
    func getAmountOfRows() -> Int
}
