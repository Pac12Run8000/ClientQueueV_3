//
//  SnapShotDataError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/24/21.
//

import Foundation

enum SnapShotDataError:Error {
    case accountDoesntExist
}


extension SnapShotDataError:CustomStringConvertible {
    var description: String {
        switch self {
        case .accountDoesntExist:
            return "The account information that you are using does not tie to an existing account."
        }
    }
    
    
}
