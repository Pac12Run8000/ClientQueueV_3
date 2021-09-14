//
//  Geocoding.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/14/21.
//

import Foundation
import UIKit
import MapKit

struct Geocoding {
    
    public static func fetchCoordinateForAddress(address:String, handler:@escaping(_ coordinate:CLLocationCoordinate2D?,_ success:Bool,_ error:Error?) -> ()) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { placemark, error in
            guard let coordinate = placemark?.first?.location?.coordinate else {
                print("Coordinate retrieval error:\(error?.localizedDescription)")
                handler(nil,false,GeocodingError.coordinatePlaceMarkError)
                return
            }
            handler(coordinate,true,nil)
        }
    }
    
    public static func fetchNSObjectCoordinateForAddress(dictionary:[String:AnyObject], handler:@escaping(_ coordObject:[String:AnyObject]?,_ success:Bool,_ error:Error?) -> ()) {
        guard let address = "\(dictionary["address"]!) \(dictionary["cityState"]!) \(dictionary["zipCode"]!)" as? String else {
            handler(nil, false, GeocodingError.addressStringFormatError)
            return
        }
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { placemarks, error in
            guard let coordinate = placemarks?.first?.location?.coordinate else {
                handler(nil, false, GeocodingError.coordinatePlaceMarkError)
                return
            }
            let object:[String:AnyObject] = ["lat":coordinate.latitude as AnyObject, "long":coordinate.longitude as AnyObject]
            handler(object, true, nil)
        }
    }
}
