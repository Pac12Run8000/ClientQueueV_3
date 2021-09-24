//
//  DataSnapshot+Extension.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/24/21.
//

import Foundation
import Firebase

extension DataSnapshot {
    
    func fetchSnaphotByID(uid:String) {
        if let accountSnapShot = self.children.allObjects as? [DataSnapshot] {
            for account in accountSnapShot {
                if account.key == uid {
                    print("account logged in:\(account.value)")
                }
            }
        }
    }
}
