//
//  DataSnapshot+Extension.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/24/21.
//

import Foundation
import Firebase

extension DataSnapshot {
    
    func fetchSnaphotByID(uid:String, completion handler:@escaping(_ success:Bool,_ snapshot:DataSnapshot?,_ error:Error?) -> ()) {
        if let accountSnapShot = self.children.allObjects as? [DataSnapshot] {
            for account in accountSnapShot {
                if account.key == uid {
                    handler(true, account, nil)
                } else {
                    handler(false, nil, SnapShotDataError.accountDoesntExist)
                }
            }
        }
    }
}
