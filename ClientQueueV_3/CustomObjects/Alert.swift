//
//  Signupstate.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/18/21.
//

import UIKit

struct Alert {
    
    static func pushErrorAlert(msg:String, control:UIViewController) {
        let alert = UIAlertController(title: "Imporatnt Message", message: msg, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "done", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        control.present(alert, animated: true, completion: nil)
    }
    
    
    static func pushactionsheet(title:String, message:String, preferredStyle:UIAlertController.Style, control:UIViewController, completionHandler:@escaping(_ imagepickerstate:ImagePickerState) -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let takephotoAction = UIAlertAction(title: "camera", style: .default) { action in
            completionHandler(.cameraphoto)
        }
        let libraryAction = UIAlertAction(title: "library photo", style: .default) { action in
            completionHandler(.photolibrary)
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { action in
            completionHandler(.noImage)
        }
        alert.addAction(takephotoAction)
        alert.addAction(libraryAction)
        alert.addAction(cancelAction)
        control.present(alert, animated: true)
    }
}
