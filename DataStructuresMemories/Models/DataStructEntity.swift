//
//  DataStructModel.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/16/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation

struct DataStructEntity: DataStructProtocol {
    var title: String
    
    var descr: String
    
    var link: String
    
    init(with title: String, description: String, link: String) {
        self.title = title
        self.descr = description
        self.link = link
    }    
}


