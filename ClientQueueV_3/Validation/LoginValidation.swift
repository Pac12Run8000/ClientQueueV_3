//
//  LoginValidation.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/7/21.
//

import UIKit

struct LoginValidation {
    
    
    static func displayLoginError(error:Result<Bool, LoginError>) -> String {
        switch error {
        case .failure(.invalidCharactersInUsername):
            return "Enter only alphanumeric characters."
        case .failure(.passwordTooShort):
            return "You must have at least 8 characters in password."
        case .failure(.passwordTooLong):
            return "You can't have more than 16 characters in password."
        case .failure(.passwordCapitalLetterMissing):
            return "You must have at least one capital letter."
        default:
            return ""
        }
    }
}
