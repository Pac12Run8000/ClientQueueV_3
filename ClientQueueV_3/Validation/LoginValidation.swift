//
//  LoginValidation.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/7/21.
//

import UIKit

struct LoginValidation {
    
    static func fetchEmailError(email:String, handler:@escaping(_ result:Result<Bool, ForgotLoginError>) -> ()) {
        
                guard !email.isEmpty else {
                    handler(.failure(.noEmail))
                    return
                }
                guard email.isValidEmail else {
                    handler(.failure(.isInvalidEmail))
                    return
                }
                
                handler(.success(true))
        
    }
}
