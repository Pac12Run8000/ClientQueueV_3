//
//  CustomStringConvertible+extension.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/17/21.
//

import Foundation

extension ForgotLoginError:CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .noEmail:
            return "No email address has been provided."
        case .isInvalidEmail:
            return "This email addressed is not formatted correctly."
        case .emailIsNotInSystem:
            return "We have no records of this email"
        default:
            return "Unidentified error"
        }
    }
    
    
    
}


extension LoginError:CustomStringConvertible {
    public var description: String {
        switch self {
        case .invalidCharactersInUsername:
            return "Enter only alphanumeric characters."
        case .passwordTooShort:
            return "You must have at least 8 characters in password."
        case .passwordTooLong:
            return "You can't have more than 16 characters in password."
        case .passwordCapitalLetterMissing:
            return "You must have at least one capital letter."
        case .emptyValue:
            return "Enter a value"
        case .usernameTooLong:
            return "You can't have more than 16 characters in a username."
        }
        
    }
    

    
    
    
}
