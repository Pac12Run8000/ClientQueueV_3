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
            loginView.usernameTextField.becomeFirstResponder()
            return false
        }
        guard let password = loginView.passwordTextField.text, password.count > 0 else {
            loginErrorLabel.text = "Enter a password."
            loginView.passwordTextField.becomeFirstResponder()
            return false
        }
        
       LoginViewControllerViewModel(username: username, password: password).validateLoginAndCompleteLoginProcess(completion: { [self] result in
            switch result {
            case .failure(let err):
                loginErrorLabel.text = LoginValidation.displayLoginError(error: result)
            case .success(let res):
                loginErrorLabel.text = ""
                print("Login successful now do somthing: \(res).")
            }
        })
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}



