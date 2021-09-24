//
//  String+Extensions.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/6/21.
//

import Foundation
import UIKit

extension String {
    
//    #"^\S+@\S+\.\S+$"#
    var isValidEmail:Bool {
        let emailPattern = #"^\S+@\S+\.\S+$"#
        let result = self.range(of: emailPattern, options: .regularExpression)
        let output = (result != nil)
        return output
    }
    
    // MARK:- Checks for alphanumeric chars
    var isAlphanumeric: Bool {
        let usernamePattern = "[^a-zA-Z0-9]"
        let result = self.range(of: usernamePattern, options: .regularExpression)
        let output = (result == nil)
        return output
    }
    
    var isPasswordLongEnough:Bool {
        let passwordParttern = #"(?=.{8,})"#
        let result = self.range(of: passwordParttern, options: .regularExpression)
        let output = (result != nil)
        return output
    }
    
    var isPasswordTooLong:Bool {
        return self.count <= 15
    }
    
    var doesHaveCapitalLetter:Bool {
        let capitalLetterPattern = #"(?=.*[A-Z])"#
        let result = self.range(of: capitalLetterPattern, options: .regularExpression)
        let output = (result != nil)
        return output
    }
    
//    "(888)888-8888"
    
    var isPhoneNumberFormatted:Bool {
        for item in self.enumerated() {
            if item.offset == 0 && item.element != "(" {
                return false
            }
        }
        for item in self.enumerated() {
            if item.offset == 4 && item.element != ")" {
                return false
            }
        }
        for item in self.enumerated() {
            if item.offset == 8 && item.element != "-" {
                return false
            }
        }
        
        return true
    }
    
    func presentMainControllerIfLoggedIn(viewController:UIViewController, spSegue:String, clientSegue:String) {
        if self == "serviceProvider" {

            viewController.performSegue(withIdentifier: spSegue, sender: nil)
        } else {

            viewController.performSegue(withIdentifier: clientSegue, sender: nil)
        }
    }
    
}



