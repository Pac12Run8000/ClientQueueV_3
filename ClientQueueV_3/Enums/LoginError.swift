//
//  LoginError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/5/21.
//

import Foundation

public enum LoginError:Error {
    case emptyValue
    case invalidUsername
    case invalidPassword
    case valueTooLong
}
