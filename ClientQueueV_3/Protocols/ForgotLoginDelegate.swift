//
//  ForgotLoginDelegate.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/11/21.
//

import Foundation


protocol ForgotLoginDelegate:AnyObject {
    func fetchLogin(didForget:Bool)
}
