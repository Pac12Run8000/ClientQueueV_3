//
//  DataAccess.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/12/21.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth



struct DataAccess {
    
    static func updateUserData(dictionary:[String:AnyObject], completionHandler:@escaping(_ success:Bool,_ err:Error?) -> ())  {
        
        
        
        guard let ref = Database.database().reference() as? DatabaseReference, let usersRef = ref.child("users").child(Auth.auth().currentUser!.uid) as? DatabaseReference else {
            completionHandler(false, SignupError.save_profile_to_realtime_database_error)
            return
        }

        
        var filteredDictionary = dictionary
        filteredDictionary["profileImage"] = nil
        
        usersRef.updateChildValues(filteredDictionary) { err, refer in
            guard err == nil else {
                completionHandler(false, SignupError.save_profile_to_realtime_database_error)
                return
            }
            
            Geocoding.fetchNSObjectCoordinateForAddress(dictionary: dictionary) { object, success, error in
                guard success == true else {
                    print("Error: \(error)")
                    completionHandler(false, GeocodingError.addressStringFormatError)
                    return
                }
                usersRef.child("location").setValue(object)
            }
           
            completionHandler(true, nil)
        }
    }
    
}
