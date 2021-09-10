//
//  UserType.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/8/21.
//

import Foundation
import UIKit

enum UserType {
    case client
    case serviceProvider
}

extension UserType {
    func performSegueToMainController(vc:UIViewController) {
        if self == .client {
            vc.performSegue(withIdentifier: "mainClientAuthSegue", sender: vc)
        } else {
            vc.performSegue(withIdentifier: "mainServiceProviderAuthSegue", sender: vc)
        }
    }
}

extension String {
    func performSegueToMainController(vc:UIViewController) {
        if self == "client" {
            vc.performSegue(withIdentifier: "mainClientAuthSegue", sender: vc)
        } else {
            vc.performSegue(withIdentifier: "mainServiceProviderAuthSegue", sender: vc)
        }
    }
}

extension UserType:CustomStringConvertible {
    var description: String {
        switch self {
        case .client:
            return "client"
        case .serviceProvider:
            return "serviceProvider"
        }
    }
    
    
}
