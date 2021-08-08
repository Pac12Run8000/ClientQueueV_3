//
//  LoginError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/5/21.
//

import Foundation

public enum LoginError:Error {
    case emptyValue
    case invalidCharactersInUsername
    case usernameTooLong
    case passwordTooLong
    case passwordTooShort
    case passwordCapitalLetterMissing
}
