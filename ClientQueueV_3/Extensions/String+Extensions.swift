//
//  String+Extensions.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/6/21.
//

import Foundation

extension String {
    
    // MARK:- Checks for alphanumeric chars
    var isAlphanumeric: Bool {
        let usernamePattern = "[^a-zA-Z0-9]"
        let result = self.range(of: usernamePattern, options: .regularExpression)
        let output = (result == nil)
        return output
        
//        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    var isPasswordLongEnough:Bool {
        let passwordParttern = #"(?=.{8,})"#
        let result = self.range(of: passwordParttern, options: .regularExpression)
        let output = (result != nil)
        return output
    }
    
    
    
}

//let passwordSet = CharacterSet(charactersIn: "aeiou&@")
//let outputArray = password.components(separatedBy: passwordSet).filter({($0.count != 0)}).count > 0 ? "Invalid Password" : "Valid Password."
