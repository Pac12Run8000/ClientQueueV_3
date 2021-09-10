//
//  GenderType.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/9/21.
//

import Foundation

enum GenderType:Int {
    case male = 0
    case female = 1
    case non_binary = 2
}

extension GenderType:CustomStringConvertible {
    var description: String {
        switch self {
        case .male:
            return "male"
        case .female:
            return "female"
        case .non_binary:
            return "non_binary"
        }
    }
    
    
}


