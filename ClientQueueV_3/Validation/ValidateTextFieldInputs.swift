//
//  ValidateTextFieldInputs.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/5/21.
//

import Foundation

struct ValidateTextFieldInputs {
    
    static func validateUserName(username:String) -> Result<Bool, LoginError> {
        guard let username = username as? String, username.count > 0 else {
            return .failure(.emptyValue)
        }
        guard username.count <= 15 else {
            return .failure(.valueTooLong)
        }
        return .success(true)
    }
}
