//
//  ControllManager.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/26/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import Foundation


class ATDControlManager: ATDControlProtocol {
    
    init(for type: DataType) {
        typeOfDataStruct = type
    }
    
    var typeOfDataStruct: DataType
    
    func createMenu() -> [TypeButton] {
        return typeOfDataStruct.buttons.map { $0 }
    }

    private func createButton(named title: String) -> TypeButton {
        return TypeButton(rawValue: title) ?? TypeButton.defaultButton
    }
}

enum DataType {
    case stack
    
    var buttons: [TypeButton] {
        switch self {
        case .stack:
            return [.now, .back, .now]
        }
    }
    
}

enum TypeButton: String {
    case go, back, now, defaultButton
}
