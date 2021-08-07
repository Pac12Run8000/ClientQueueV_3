//
//  LoginViewControllerViewModel.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/6/21.
//

import UIKit

struct LoginViewControllerViewModel {
    
    var username:String
    var password:String
    
    
    init(username:String = "", password:String = "") {
        self.username = username
        self.password = password
    }
    
    func validateLogin() -> Result<Bool, LoginError> {
        guard !self.username.isEmpty else {
            return (.failure(.emptyValue))
        }
        guard self.username.isAlphanumeric else {
            return .failure(.invalidCharactersInUsername)
        }
        guard self.username.count <= 15 else {
            return .failure(.usernameTooLong)
        }
        guard !self.password.isEmpty else {
            return .failure(.emptyValue)
        }
        guard self.password.count <= 15 else {
            return .failure(.passwordTooLong)
        }
        guard self.password.isPasswordLongEnough else {
            return .failure(.improperPasswordLength)
        }
        return .success(true)
    }
    
    
    
}
