//
//  DataStructModel.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/16/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

struct DataStructModel: DataStruct {
    var title: String {
        return titleOfDataStruct
    }
    
    var descr: String {
        return descriptionOfDataStruct
    }
    
    init(with title: String, _ description: String) {
        titleOfDataStruct = title
        descriptionOfDataStruct = description
    }
    
    private var titleOfDataStruct: String
    private var descriptionOfDataStruct: String
    
}


