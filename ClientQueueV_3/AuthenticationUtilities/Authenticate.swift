//
//  Authenticate.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/8/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

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
    
    static func signInForFirebaseAuthRealtimeDatabase(dictionary:[String:AnyObject], control:UIViewController, handler:@escaping(_ succeed:Bool,_ error:Error?) -> ()) {
        print("dictionary:\(dictionary)")
        Auth.auth().createUser(withEmail: dictionary["email"] as! String, password: dictionary["password"] as! String) { result, error in
            guard error == nil else {
                handler(false, error)
                return
            }
            
            guard let ref = Database.database().reference() as? DatabaseReference, let usersRef = ref.child("users").child(Auth.auth().currentUser!.uid) as? DatabaseReference else {
                handler(false, SignupError.client_save_profile_to_realtime_database_error)
                return
            }

            usersRef.updateChildValues(dictionary) { err, refer in
                guard err == nil else {
                    handler(false, SignupError.client_save_profile_to_realtime_database_error)
                    return
                }
            }
            handler(true, nil)
            let value = dictionary["userType"] as! String
            value.performSegueToMainController(vc: control)
            
        }
        
        
        
    }
}
