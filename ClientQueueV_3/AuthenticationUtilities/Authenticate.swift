//
//  Authenticate.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/8/21.
//

import UIKit
import FirebaseAuth


struct Authenticate {
    
    static func logoutAndPopToRoot(control:UIViewController) throws {
        guard Auth.auth().currentUser?.uid != nil else {
            throw SignoutError.userNotLoggedIn
        }
        do {
        try Auth.auth().signOut()
            control.navigationController?.popToRootViewController(animated: true)
        } catch {
            throw error
        }
    }
    
    static func signUpForFirebaseAuthAndRealtimeDatabase(dictionary:[String:AnyObject], control:UIViewController, handler:@escaping(_ succeed:Bool,_ error:Error?) -> ()) {

        Auth.auth().createUser(withEmail: dictionary["email"] as! String, password: dictionary["password"] as! String) { result, error in
            guard error == nil else {
                handler(false, error)
                return
            }
            
            DataAccess.updateUserData(dictionary: dictionary) { error in
                guard error == nil else {
                    handler(false, error)
                    return
                }
            }
            
            handler(true, nil)
            let userTypeValue = dictionary["userType"] as! String
            userTypeValue.performSegueToMainController(vc: control)
            
        }
        
        
        
    }
}
