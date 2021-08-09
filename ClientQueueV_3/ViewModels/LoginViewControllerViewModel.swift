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
    
    func validateLogin(completion:@escaping(_ result:Result<Bool, LoginError>) -> ()) {
        guard !self.username.isEmpty else {
            completion(.failure(.emptyValue))
            return
        }
        guard self.username.isAlphanumeric else {
            completion(.failure(.invalidCharactersInUsername))
            return
        }
        guard self.username.count <= 15 else {
            completion(.failure(.usernameTooLong))
            return
        }
        guard !self.password.isEmpty else {
            completion(.failure(.emptyValue))
            return
        }
        guard self.password.isPasswordLongEnough else {
            completion(.failure(.passwordTooShort))
            return
        }
        guard self.password.count <= 15 else {
            completion(.failure(.passwordTooLong))
            return
        }
        guard self.password.doesHaveCapitalLetter else {
            completion(.failure(.passwordCapitalLetterMissing))
            return
        }
       
        completion(.success(true))
    }
    
    
    
}
