//
//  DataStructModel.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/16/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

struct DataStructEntity: DataStructProtocol {
    var title: String {
        return titleOfDataStruct
    }
    
    var descr: String {
        return descriptionOfDataStruct
    }
    
    var link: String {
        return linkOfDataStruct
    }
    
    init(with title: String, _ description: String, _ link: String) {
        titleOfDataStruct = title
        descriptionOfDataStruct = description
        linkOfDataStruct = link
    }
    
    private var titleOfDataStruct: String
    private var descriptionOfDataStruct: String
    private var linkOfDataStruct: String
    
}


