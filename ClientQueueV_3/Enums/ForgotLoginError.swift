//
//  ForgotLoginError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/6/21.
//

import Foundation


public enum ForgotLoginError:Error {
    case noEmail
    case isInvalidEmail
    case emailIsNotInSystem
}


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
