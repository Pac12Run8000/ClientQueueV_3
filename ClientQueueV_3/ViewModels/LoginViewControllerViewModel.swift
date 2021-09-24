//
//  LoginViewControllerViewModel.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/6/21.
//

import UIKit
import FirebaseDatabase
import Firebase
import CodableFirebase

struct LoginViewControllerViewModel {
    
    var email:String
    var password:String
    
    
    init(email:String = "", password:String = "") {
        self.email = email
        self.password = password
    }
    
    
    func validateCredentialsAndAuthenticate(vc: UIViewController, completion:@escaping(_ result:Result<Bool, LoginError>) -> ()) {
        
        guard self.email.trimmingCharacters(in: .whitespaces) != "" else {
            completion(.failure(.nowhitespacesAllowedEmail))
            return
        }
        guard !self.email.isEmpty, self.email.count > 0 else {
            completion(.failure(.noemail))
            return
        }
        guard self.email.isValidEmail else {
            completion(.failure(.invalidEmail))
            return
        }
        guard self.password.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            completion(.failure(.nowhitespacesAllowedPassword))
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
        
        Auth.auth().signIn(withEmail: self.email, password: self.password) { result, error in
            guard error == nil else {
                completion(.failure(.authSignIn(desc: error!.localizedDescription)))
                return
            }
            
            print("Signed In!!!")
            DataAccess.fetchCurrentUserTypeAsString { success, error, userType in
                guard error == nil else {
                    completion(.failure(.noUserType))
                    return
                }
               
                userType?.presentMainControllerIfLoggedIn(viewController: vc, spSegue: "segueServiceProvider", clientSegue: "segueClient")
            }
            
        }
        
//        Datafetching.fetchUsersSnapshot { snapshot in
//
//            snapshot?.fetchSnaphotByID(uid: "bomN33hqhJaZwwDdOPeVRbaCWNY2", completion: { success, snapshot, error in
//                guard success == true else {
//                    return
//                }
//                print("snapshot:", snapshot)
//            })
//        }
        
        return
        
        
        
        completion(.success(true))
    }

    
    
    
}
