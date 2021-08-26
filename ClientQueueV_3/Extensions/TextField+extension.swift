//
//  TextField+extension.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/26/21.
//

import UIKit

extension UITextField {
    
    public func filterTextField(filterString:String, range:NSRange, replacementString string: String, inverted:Bool) -> Bool {
        var aSet = CharacterSet()
        var newText = self.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        if inverted == true {
            aSet = CharacterSet(charactersIn:filterString).inverted
        } else {
            aSet = CharacterSet(charactersIn:filterString)
        }

        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")

        return string == numberFiltered && newText.length <= 5
    }
}
