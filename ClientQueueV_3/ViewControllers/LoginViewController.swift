//
//  ViewController.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/4/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.usernameTextField.becomeFirstResponder()
        
        loginView.usernameTextField.delegate = self
        loginView.passwordTextField.delegate = self
        
    }


}



// MARK:- UITextFieldDelegate functionality
extension LoginViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            if let usernameInput = textField.text {
                let validationData = ValidateTextFieldInputs.validateUserName(username: usernameInput)
                switch validationData {
                case .failure(let err):
                    print(err)
                case .success(let bool):
                    print(bool)
                }
                
            }
        } else if textField.tag == 1 {
            
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

