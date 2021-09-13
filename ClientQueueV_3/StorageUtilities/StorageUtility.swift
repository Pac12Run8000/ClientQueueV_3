//
//  StorageUtility.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/13/21.
//

import Foundation
import FirebaseStorage
import FirebaseAuth


struct StorageUtility {
    
    static func uploadProfileImage(profileImage:UIImage, uid:String, handler:@escaping(_ uploadErr:Error?, _ success:Bool) -> ()) {
        
        let storageRef = Storage.storage().reference().child("profileImages").child(uid).child("\(NSUUID().uuidString).jpg")
        guard let compressedImage = profileImage.jpegData(compressionQuality: 0.1) else {
            handler(ProfileImageError.compressJpegError, false)
            return
        }
        
        storageRef.putData(compressedImage, metadata: nil) { metaData, error in
            guard error == nil else {
                handler(error, false)
                return
            }
            handler(nil, true)
        }
        handler(nil, true)
    }
}
