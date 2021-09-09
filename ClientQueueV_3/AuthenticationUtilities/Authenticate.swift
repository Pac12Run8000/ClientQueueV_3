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
}
