//
//  LoginViewControllerViewModel.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/6/21.
//

import UIKit

struct LoginViewControllerViewModel {
    
    var email:String
    var password:String
    
    
    init(email:String = "", password:String = "") {
        self.email = email
        self.password = password
    }
    
    
    func validateCredentialsAndAuthenticate(completion:@escaping(_ result:Result<Bool, LoginError>) -> ()) {
        guard !self.email.isEmpty, self.email.count > 0 else {
            completion(.failure(.noemail))
            return
        }
        guard self.email.isValidEmail else {
            completion(.failure(.invalidEmail))
            return
        }
        guard !self.password.isEmpty, self.password.count > 0 else {
            completion(.failure(.nopassword))
            return
        }
        guard self.password.count >= 4 else {
            completion(.failure(.passwordMustBeGreaterThan4))
            return
        }
        guard self.password.count <= 15 else {
            completion(.failure(.passwordMustBeLessThan16))
            return
        }
        guard self.password.doesHaveCapitalLetter else {
            completion(.failure(.passwordMustHaveCapitalLetter))
            return
        }
        
        completion(.success(true))
    }

    
    
    
}
