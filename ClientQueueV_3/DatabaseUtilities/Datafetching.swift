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
    
    
    static func fetchAllEmailsInTheSystem(completion handler:@escaping(_ emails:[String]?) -> ()) {
        Datafetching.fetchUsersSnapshot { snapshot in
            var emails = [String]()
            if let snapArray = snapshot?.children.allObjects as? [DataSnapshot] {
                for item in snapArray {
                    guard let userArray = item.value as? [String:AnyObject] else {return}

                    guard let email = userArray["email"] as? String else {return}
                    emails.append(email)
                }
                handler(emails)
            } else {
                handler(nil)
            }
        }
    }
    
    
    static func fetchServiceProviderModel(uid:String, handler:@escaping(_ err:Error?,_ serviceProvider:ServiceProvider?,_ success:Bool) -> ()) {
        
        Datafetching.fetchUsersSnapshot { snapshot in
            guard let snapshot = snapshot else {
                print("There is no snapshot")
                handler(SnapShotDataError.noSnapshotExists, nil, false)
                return
            }
            snapshot.fetchSnaphot(by: uid) { success, snapshot, error in
                guard let data = snapshot?.value else {return}
                guard let serviceProvider = try? FirebaseDecoder().decode(ServiceProvider.self, from: data) else {
                    print("There is no service provider.")
                    handler(SnapShotDataError.couldNotMakeCustomObject, nil, false)
                    return
                }
                guard let serviceProvider = serviceProvider as? ServiceProvider else {
                    handler(SnapShotDataError.couldNotMakeCustomObject, nil, false)
                    return
                }
                
                handler(nil, serviceProvider, true)
               
            }


        }
    }
    
    
    static func fetchClientModel(uid:String, handler:@escaping(_ err:Error?,_ client:Client?,_ success:Bool) -> ()) {
        Datafetching.fetchUsersSnapshot { snapshot in
            guard let snapshot = snapshot else {
                print("There is no snapshot")
                handler(SnapShotDataError.noSnapshotExists, nil, false)
                return
            }

            snapshot.fetchSnaphot(by: uid, completion: { success, childSnapshot, error in
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
