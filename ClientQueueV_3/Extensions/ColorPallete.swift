//
//  ColorPallete.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/5/21.
//

import UIKit

extension UIColor {
    
    static let lightBlue = UIColor.colorFromHex("048ABF")
    static let cyan2 = UIColor.colorFromHex("04BFBF")
    static let lightGreen = UIColor.colorFromHex("04BF7B")
    static let darkGreen = UIColor.colorFromHex("038C5A")
    static let beige = UIColor.colorFromHex("F2D7B6")
    
    
    static func colorFromHex(_ hex:String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (hexString.hasPrefix("#")) {
            hexString.remove(at: hexString.startIndex)
        }
        
        if (hexString.count != 6) {
            return UIColor.black
        }
        
        var rgb:UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: 1.0)
        
    }
    
    
    
    
}
