//
//  GeocodingError.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/14/21.
//

import Foundation

enum GeocodingError:Error {
    case coordinatePlaceMarkError
    case addressStringFormatError
    case coordinateObjectError
}


extension GeocodingError:CustomStringConvertible {
    var description: String {
        switch self {
        case .coordinatePlaceMarkError:
            return "There was an error retrieving your location information."
        case .addressStringFormatError:
            return "There was an error formatting the address."
        case .coordinateObjectError:
            return "There was an error obtaining coordinate information for the realtime database."
        }
    }
    
    
    
}
