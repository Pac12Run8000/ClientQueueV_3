//
//  ProfileImageError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/18/21.
//

import Foundation


public enum ProfileImageError:Error {
    case cameraIsNotAvailable
    case photoLibraryIsNotAvailable
    case noImageAvailable
}



extension ProfileImageError:CustomStringConvertible {
    public var description: String {
        switch self {
        case .cameraIsNotAvailable:
            return "The camera is not available on this device."
        case .photoLibraryIsNotAvailable:
            return "This device cannot access the photo library."
        case .noImageAvailable:
            return "Please select an image for the profile"
        }
    }
    
    
}
