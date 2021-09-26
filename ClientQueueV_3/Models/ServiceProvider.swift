//
//  ServiceProvider.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/25/21.
//

import Foundation
import CodableFirebase

struct ServiceProvider:Codable {
    var businessName:String?
    var address:String
    var cityState:String
    var email:String
    var firstname:String
    var gender:String
    var lastname:String
    var location:spCoordinate
    var password:String
    var phone:String
    var userType:String
    var username:String
    var zipCode:String
}

struct spCoordinate:Codable {
    var lat:Float
    var long:Float
}
