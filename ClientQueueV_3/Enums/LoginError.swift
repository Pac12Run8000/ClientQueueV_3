//
//  LoginError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/5/21.
//

import Foundation

public enum LoginError:Error {
    case noemail
    case nopassword
    case invalidEmail
    case passwordMustBeGreaterThan4
    case passwordMustBeLessThan16
    case passwordMustHaveCapitalLetter
    case nowhitespacesAllowedEmail
    case nowhitespacesAllowedPassword
    case noUserId
}

extension LoginError:CustomStringConvertible {
    public var description: String {
        switch self {
        case .noemail:
            return "Enter an email address."
        case .nopassword:
            return "Enter a password."
        case .invalidEmail:
            return "The email is invalid. Please enter a properly formatted email address"
        case .passwordMustBeGreaterThan4:
            return "The password must have at least 4 characters."
        case .passwordMustBeLessThan16:
            return "The password can have no more than 15 characters."
        case .passwordMustHaveCapitalLetter:
            return "The password must have at least one capital letter."
        case .nowhitespacesAllowedEmail:
            return "No whitespace allowed in email."
        case .nowhitespacesAllowedPassword:
            return "No whitespace allowed in password."
        case .noUserId:
            return "There was no user id and user could not be authenticated."
        }
    }
}









