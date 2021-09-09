//
//  SignoutError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/8/21.
//

import Foundation


enum SignoutError:Error {
    case userNotLoggedIn
    case err(myErr:Error)
}

extension SignoutError:CustomStringConvertible {
    var description: String {
        switch self {
        case .userNotLoggedIn:
            return "The user is not logged in."
        case .err:
            return "There was an error with the signout"
        }
    }
}
