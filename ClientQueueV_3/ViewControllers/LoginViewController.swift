//
//  ViewController.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/4/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginErrorLabel: UILabel!
    @IBOutlet weak var loginView: LoginView!
    
    var viewModel:LoginViewControllerViewModel?
    
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
        guard let username = loginView.usernameTextField.text, username.count > 0 else {
            loginErrorLabel.text = "Enter a username."
            return false
        }
        guard let password = loginView.passwordTextField.text, password.count > 0 else {
            loginErrorLabel.text = "Enter a password."
            return false
        }
        viewModel = LoginViewControllerViewModel(username: username, password: password)
        if let error = viewModel?.validateLogin() {
            loginErrorLabel.text = LoginValidation.displayLoginError(error: error)
        }
 
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}



