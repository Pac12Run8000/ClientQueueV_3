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
        loginView.forgotLoginDelegate = self
        loginView.signupDelegate = self
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
        
        LoginViewControllerViewModel(username: username, password: password).validateLoginAndCompleteLoginProcess(completion: { result in
            
            
            
            switch result {
            case .failure(let err):
                self.loginErrorLabel.text = err.description
            case .success(_ ):
                self.loginErrorLabel.text = "Login is successful."
            }
        })
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension LoginViewController: ForgotLoginDelegate {
    func fetchLogin() {
        performSegue(withIdentifier: "forgotLoginSegue", sender: nil)
    }
    
    
    
    
    
}

extension LoginViewController: SignupDelagate {
    func fetchSignup() {
        performSegue(withIdentifier: "signUpSegueue", sender: nil)
    }
    
    
}



