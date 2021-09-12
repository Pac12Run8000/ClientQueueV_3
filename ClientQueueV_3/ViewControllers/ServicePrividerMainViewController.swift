//
//  ServicePrividerMainViewController.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/8/21.
//

import UIKit

class ServicePrividerMainViewController: UIViewController {
    
    @IBOutlet weak var logoutButtonView: LogoutButtonView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        logoutButtonView.logoutdelegate = self
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
