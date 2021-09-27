//
//  ForgotLoginViewController.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/11/21.
//

import UIKit
import Firebase

class ForgotLoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errormsgLabel: UILabel!
    
    var emailArray = [String]() {
        didSet {
            print("email:\(emailArray)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Datafetching.fetchAllEmailsInTheSystem { emails in
            guard let emails = emails else {return}
            self.emailArray = emails
        }
        

        emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        

        
    }
    

    

}


extension ForgotLoginViewController {
    
    private func isEmailInSystem(sysEmail:String, textFieldEmail:String) -> Bool {
        if sysEmail != textFieldEmail {
            return false
        }
        return true
    }
}

extension ForgotLoginViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let email = textField.text else {
            return false
        }
        
        LoginValidation.fetchEmailError(email: email) { result in
            switch result {
            case .failure(let err):
                self.errormsgLabel.text = err.description
            case .success(_ ):
                self.errormsgLabel.text = "Log into your email to reset your password."
            }
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
}
