//
//  UIColorFromHex.swift
//  SwiftyDex
//
//  Created by Rob on 4/17/20.
//  Copyright © 2020 Rob Gruen. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hexValue: String) {
        var redValue: UInt8 = 0
        var greenValue: UInt8 = 0
        var blueValue: UInt8 = 0
        var i = 0
        
        if (hexValue.count != 6) {
            self.init(red: 255, green: 255, blue: 255, alpha: 1.0)
        }
        
        while (i < 5) {
            let index1 = hexValue.index(hexValue.startIndex, offsetBy: i)
            let char1 = hexValue[index1]
            let index2 = hexValue.index(hexValue.startIndex, offsetBy: (i + 1))
            let char2 = hexValue[index2]
            let hexCharacters = String(char1) + String(char2)
            if (i == 0) {
                redValue = UInt8(hexCharacters, radix: 16)!
            } else if (i == 2) {
                greenValue = UInt8(hexCharacters, radix: 16)!
            } else {
                blueValue = UInt8(hexCharacters, radix: 16)!
            }
            i += 2
        }
        
        self.init(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1.0)
    }
    
}
