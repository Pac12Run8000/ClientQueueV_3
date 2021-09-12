//
//  DataAccess.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/12/21.
//

import Foundation
import Firebase

struct DataAccess {
    
    static func updateUserData(dictionary:[String:AnyObject], completionHandler:@escaping(_ err:Error?) -> ())  {
        
        
        
        guard let ref = Database.database().reference() as? DatabaseReference, let usersRef = ref.child("users").child(Auth.auth().currentUser!.uid) as? DatabaseReference else {
            completionHandler(SignupError.save_profile_to_realtime_database_error)
            return
        }

        usersRef.updateChildValues(dictionary) { err, refer in
            guard err == nil else {
                completionHandler(SignupError.save_profile_to_realtime_database_error)
                return
            }
            completionHandler(nil)
        }
    }
    
}
