//
//  Datafetching.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/22/21.
//

import Foundation
import UIKit
import FirebaseDatabase
import CodableFirebase

class Datafetching {
    
    static func fetchClientModel(uid:String, handler:@escaping(_ err:Error?,_ client:Client?,_ success:Bool) -> ()) {
        Datafetching.fetchUsersSnapshot { snapshot in
            snapshot?.fetchSnaphotByID(uid: uid, completion: { success, childSnapshot, error in
                guard error == nil else {
                    handler(LoginError.noDataAvailableForUser, nil, false)
                    return
                }
                guard let data = childSnapshot?.value else {return}
                guard let client = try? FirebaseDecoder().decode(Client.self, from: data) else {
                    handler(error, nil, false)
                    return
                }
                handler(nil, client, true)
            })
            
        }
    }
    
    
    static func fetchUsersSnapshot(handler:@escaping(_ snapshot:DataSnapshot?) -> ()){
        guard let ref = Database.database().reference().child("users") as? DatabaseReference else {
            handler(nil)
            return
        }
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            if let snapshot = snapshot as? DataSnapshot {
                handler(snapshot)
            } else {
                handler(nil)
            }
            
        }, withCancel: nil)
        
    }
}
