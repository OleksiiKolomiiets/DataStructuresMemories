//
//  CustomTextFeild.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 5/3/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class CustomTextFeild: UITextField, UITextFieldDelegate {
    
    var callAction: ( (String)->() )?
    
    init(placeholder: String, keyboardType: UIKeyboardType, action: ((String)->())? = nil ) {
        super.init(frame: .zero)
        
        self.callAction = action
        self.borderStyle = .roundedRect
        self.autoresizesSubviews = false
        self.keyboardType = keyboardType
        self.placeholder = placeholder
        self.delegate = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let permissibleCharacters = string.components(separatedBy: aSet).joined(separator: "")
        let newLength = text.count + string.count - range.length
        let maxSize = 4
        if (string == permissibleCharacters || self.keyboardType != .decimalPad) && newLength <= maxSize {
            if let text = text as? NSString {
                let result = text.replacingCharacters(in: range, with: string)
                callAction?(result)
                return true
            }
        }
        return false
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
