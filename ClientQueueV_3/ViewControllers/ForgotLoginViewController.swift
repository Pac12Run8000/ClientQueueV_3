//
//  ForgotLoginViewController.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/11/21.
//

import UIKit

class ForgotLoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errormsgLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        
    }
    

    

}

extension ForgotLoginViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
}
