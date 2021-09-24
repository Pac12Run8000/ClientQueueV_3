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
    
    
    func validateCredentialsAndAuthenticate(completion:@escaping(_ result:Result<Bool, LoginError>) -> ()) {
        Datafetching.fetchUsersSnapshot { snapshot in
            
            snapshot?.fetchSnaphotByID(uid: "bomN33hqhJaZwwDdOPeVRbaCWNY2")
            
//            if let clientSnapshot = snapshot!.children.allObjects as? [DataSnapshot] {
                
//                for client in clientSnapshot {
//                    print("client:\(client.value)")
//                    if let dictionary = client.value as? [String:AnyObject] {
//                        print(dictionary["address"])
//                    }
//                }
//            }
          
            
//            if let dict = snapshot?.value as? [String:Any] {
//                print("Dict == \(dict)")
//            }
//            do {
//                let response = try FirebaseDecoder().decode(User.self, from: snapshot?.value)
//                print(response)
//            } catch {
//                print("Error:error:\(error)")
//            }
            
            
        }
        
        return
        
        
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
        
        
        
        completion(.success(true))
    }

    
    
    
}
