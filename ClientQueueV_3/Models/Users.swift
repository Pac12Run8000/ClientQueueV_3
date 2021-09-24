//
//  Client.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/23/21.
//

import Foundation

struct Users:Codable {
    var users:User
}


struct User:Codable {
    var address:String
    var cityState:String
}
