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
        var collectionButtons = [TypeButton]()
        let numberOfButtons = typeOfDataStruct.buttons.count
        for index in 0..<numberOfButtons {
            let title = typeOfDataStruct.buttons[index].rawValue
            collectionButtons.append(createButton(named: title))
        }
        return collectionButtons
    }

    private func createButton(named title: String) -> TypeButton {
        if let button = TypeButton(rawValue: title) {
            return button
        } else {
            return TypeButton.now
        }
    }
}

enum DataType {
    case stack
    
    var buttons: [TypeButton] {
        switch self {
        case .stack:
            return [.go, .back, .now]
        }
    }
    
}

enum TypeButton: String {
    case go, back, now
    
    func getTypeOfItem() {
    
    }
}
