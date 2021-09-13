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
            
            print("uid:",result?.user.uid)
            
            
            DataAccess.updateUserData(dictionary: dictionary) { success, error in
                guard success == true else {
                    handler(false, error)
                    return
                }
                guard let image = dictionary["profileImage"] as? UIImage else {
                    print("Couldn't retrieve a profileImage from the dictionary.")
                    handler(false, ProfileImageError.noImageAvailable)
                    return
                }
                
                guard let uid = Auth.auth().currentUser?.uid else {
                    print("No user id available.")
                    handler(false, LoginError.noUserId)
                    return
                }
                
                StorageUtility.uploadProfileImage(profileImage: image, uid: uid) { err, isCompleted in
                    guard isCompleted == true else {
                        handler(false, ProfileImageError.uplaodError)
                        return
                    }
                }
                handler(true, nil)
            }
            
            handler(true, nil)
            let userTypeValue = dictionary["userType"] as! String
            userTypeValue.performSegueToMainController(vc: control)
            
        }
        
        
        
    }
}
