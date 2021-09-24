//
//  ViewController.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/4/21.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginView: LoginView!
    
    var viewModel:LoginViewControllerViewModel?
    
    var dataAccess:DataAccess!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DataAccess.fetchCurrentUserTypeAsString() { succeed, error, userType in
           
            if let userType = userType, succeed == true {
                userType.presentMainControllerIfLoggedIn(viewController: self, spSegue: "segueServiceProvider", clientSegue: "segueClient")
            }

        }
        
        loginView.emailTextField.delegate = self
        loginView.passwordTextField.delegate = self
        loginView.forgotLoginDelegate = self
        loginView.signupDelegate = self
    }


}



// MARK:- UITextFieldDelegate functionality
extension LoginViewController:UITextFieldDelegate {
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let email = loginView.emailTextField.text else {
            return false
        }
        guard let password = loginView.passwordTextField.text else {
            return false
        }
        viewModel = LoginViewControllerViewModel(email: email, password: password)
        viewModel?.validateCredentialsAndAuthenticate(vc: self, completion: { result in
            switch result {
            case .failure(let errDesc):
                Alert.pushErrorAlert(msg: errDesc.description, control: self)
            case .success(_ ):
                print("Logged In")
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

extension LoginViewController: SignupDelegate {
    func fetchSignup() {
        performSegue(withIdentifier: "signUpSegueue", sender: nil)
    }
}




