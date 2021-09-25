//
//  Client.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/23/21.
//

import Foundation
import CodableFirebase

struct Client:Codable {
    var address:String
    var cityState:String
    var email:String
    var firstname:String
    var gender:String
    var lastname:String
    var location:Coordinate
    var password:String
    var userType:String
}

struct Coordinate:Codable {
    var lat:Float
    var long:Float
}



