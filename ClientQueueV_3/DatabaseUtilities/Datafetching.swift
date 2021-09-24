//
//  Datafetching.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/22/21.
//

import Foundation
import UIKit
import FirebaseDatabase

class Datafetching {
    
    
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
