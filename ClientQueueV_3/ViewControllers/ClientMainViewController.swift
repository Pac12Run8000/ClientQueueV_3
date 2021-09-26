//
//  ClientMainViewController.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/8/21.
//

import UIKit
import FirebaseAuth


class ClientMainViewController: UIViewController {
    
    let uid:String? = Auth.auth().currentUser?.uid
    var client:Client? {
        didSet {
            guard let client = client else {return}
            print("client:\(client)")
        }
    }
    
    @IBOutlet weak var logoutBtnView: LogoutButtonView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Datafetching.fetchClientModel(uid: uid!) { err, client, success in
            guard success == true else {
                return
            }
            self.client = client
        }
        

        
        logoutBtnView.logoutdelegate = self
        

        

        


        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    

    
    

}

extension ClientMainViewController:LogoutDelegate {
    
    func logout() {
        do {
            try Authenticate.logoutAndPopToRoot(control: self)
        } catch {
            Alert.pushErrorAlert(msg: error.localizedDescription, control: self)
        }
    }
    
    
}

