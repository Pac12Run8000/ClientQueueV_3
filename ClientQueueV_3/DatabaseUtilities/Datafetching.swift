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
        
        //        Datafetching.fetchUsersSnapshot { snapshot in
        //            guard let snapshot = snapshot else {
        //                print("No snapshot data.")
        //                return
        //            }
        //            snapshot.fetchSnaphot(by: self.uid!) { success, snapshot, error in
        //                guard let data = snapshot?.value else {
        //                    return
        //                }
        //
        //                guard let serviceProvider = try? FirebaseDecoder().decode(ServiceProvider.self, from: data) else {
        //                    return
        //                }
        //
        //                self.serviceProvider = serviceProvider
        //            }
        //
        //        }
    }
    
    
    static func fetchClientModel(uid:String, handler:@escaping(_ err:Error?,_ client:Client?,_ success:Bool) -> ()) {
        Datafetching.fetchUsersSnapshot { snapshot in
            snapshot?.fetchSnaphot(by: uid, completion: { success, childSnapshot, error in
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
