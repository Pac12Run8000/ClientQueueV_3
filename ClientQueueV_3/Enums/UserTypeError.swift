//
//  UserTypeError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/24/21.
//

import Foundation


enum UserTypeError:Error {
    case noUserType
}


extension UserTypeError:CustomStringConvertible {
    var description: String {
        switch self {
        case .noUserType:
            return "The app cannot figure out what kind of user you are."
        }
    }
    
    
}
