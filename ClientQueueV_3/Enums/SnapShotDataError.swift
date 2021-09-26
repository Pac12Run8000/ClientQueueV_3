//
//  SnapShotDataError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/24/21.
//

import Foundation

enum SnapShotDataError:Error {
    case accountDoesntExist
    case couldNotMakeCustomObject
    case couldNotFetchDataSnapshot
    case noSnapshotExists
}


extension SnapShotDataError:CustomStringConvertible {
    var description: String {
        switch self {
        case .accountDoesntExist:
            return "The account information that you are using does not tie to an existing account."
        case .couldNotMakeCustomObject:
            return "There was an error creating the custom object using codable firebase"
        case .couldNotFetchDataSnapshot:
            return "There was an error retrieving the appropriate data"
        case .noSnapshotExists:
            return "There was an error retrieving account data."
        }
    }
    
    
}
