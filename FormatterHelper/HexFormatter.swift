//
//  HexFormatter.swift
//  FormatterHelper
//
//  Created by Thulani Mtetwa on 2024/05/29.
//

import Foundation

class HexFormatter: Formatter {
    
    let hexCharacterSet = CharacterSet(charactersIn: "0123456789ABCDEFabcdef")
    
    private func isValidHex(_ value: String) -> Bool {
        guard let invalidHexRange = value.rangeOfCharacter(from: hexCharacterSet.inverted) else {
            return true
        }
        return invalidHexRange.isEmpty
    }
    
    override func string(for obj: Any?) -> String? {
        guard let string = obj as? String,
              string.count == 6,
              isValidHex(string) else { return nil }
        
        return "#\(string)"
    }
    
    override func getObjectValue(
        _ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?,
        for string: String,
        errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?
    ) -> Bool {
        let hexValue: String
        if string.contains("#") {
            hexValue = String(string.dropFirst())
        } else {
            hexValue = string
        }
        
        obj?.pointee = hexValue as AnyObject
        return true
    }
    
    
    override func isPartialStringValid(
        _ partialString: String,
        newEditingString newString: AutoreleasingUnsafeMutablePointer<NSString?>?,
        errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?
    ) -> Bool {
        guard partialString.count <= 6 else { return false }
        return isValidHex(partialString)
    }
}
