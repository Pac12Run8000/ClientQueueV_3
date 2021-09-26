//
//  ServicePrividerMainViewController.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/8/21.
//

import UIKit
import FirebaseAuth
import Firebase
import CodableFirebase

class ServicePrividerMainViewController: UIViewController {
    
    @IBOutlet weak var logoutButtonView: LogoutButtonView!
    let uid:String? = Auth.auth().currentUser?.uid
    var serviceProvider:ServiceProvider? {
        didSet {
            print("didSet: \(serviceProvider)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        logoutButtonView.logoutdelegate = self
        
        Datafetching.fetchServiceProviderModel(uid: uid!) { err, serviceProvider, success in
            guard success == true else {
                return
            }
            self.serviceProvider = serviceProvider
        }
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    

    

}

extension ServicePrividerMainViewController:LogoutDelegate {
    
    func logout() {
        do {
            try Authenticate.logoutAndPopToRoot(control: self)
        } catch {
            Alert.pushErrorAlert(msg: error.localizedDescription, control: self)
        }
    }
    
    
}
