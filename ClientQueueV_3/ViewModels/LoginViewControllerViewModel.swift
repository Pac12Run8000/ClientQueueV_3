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
    
    func validateLoginAndCompleteLoginProcess(completion:@escaping(_ result:Result<Bool, LoginError>) -> ()) {
        
        guard self.username.isAlphanumeric else {
            completion(.failure(.invalidCharactersInUsername))
            return
        }
        guard self.username.count <= 15 else {
            completion(.failure(.usernameTooLong))
            return
        }
        guard self.password.count >= 4 else {
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
