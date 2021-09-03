//
//  ClientSignupError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/31/21.
//

import Foundation


enum ClientSignupError:Error {
    case no_first_name
    case no_last_name
    case only_alphanumeric_chars
}


extension ClientSignupError:CustomStringConvertible {
    var description: String {
        switch self {
        case .no_first_name:
            return "Enter a first name"
        case .no_last_name:
            return "Enter a last name"
        case .only_alphanumeric_chars:
            return "Enter only alpha-numeric characters."
        }
    }
}




