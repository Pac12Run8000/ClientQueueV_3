//
//  ProfileImageError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/18/21.
//

import Foundation


public enum ProfileImageError:Error {
    case cameraIsNotAvailable
    
}

extension ProfileImageError:CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .cameraIsNotAvailable:
            return "The camera is not available on this device."
        }
    }
    
    
}
