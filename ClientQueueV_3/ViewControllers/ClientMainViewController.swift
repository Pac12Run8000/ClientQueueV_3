//
//  ClientMainViewController.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/8/21.
//

import UIKit
import FirebaseAuth

class ClientMainViewController: UIViewController {
    
    
    @IBOutlet weak var logoutBtnView: LogoutButtonView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutBtnView.logoutdelegate = self
        
        print("Auth: \(Auth.auth().currentUser?.email), uiD: \(Auth.auth().currentUser?.uid)")
        

        


        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    

    
    

}

extension ClientMainViewController:LogoutDelegate {
    func logout() {
        do {
        try Auth.auth().signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch {
            print("error:\(error.localizedDescription)")
            
        }
        
        
    }
    
    
}

