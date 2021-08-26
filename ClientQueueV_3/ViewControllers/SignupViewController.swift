//
//  SignupViewController.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/11/21.
//

import UIKit

class SignupViewController: UIViewController {
    
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var clientView: ClientSignupView!
    @IBOutlet weak var spView: SPSignupView!
    var viewModel:SignUpViewControllerViewModel?
    
    
    var signupstate:SignupState = .clientState {
        didSet {
            viewModel = SignUpViewControllerViewModel(signupState: signupstate, client: clientView, serviceProvider: spView, controller: self)
            viewModel?.fetchFormForSignup(completionHandler: { clientAlpha, spAlpha in
                self.clientView.alpha = clientAlpha
                self.spView.alpha = spAlpha
            })
        }
    }
    
    var imgPickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupstate = .clientState

        
        // MARK: Observers for moving the textfields above the keyboard so that the view is not obscured.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        
        imgPickerController.delegate = self
        imgPickerController.allowsEditing = true
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(didTapImage(sender:)))
        profileImageView.configureProfileImageView(borderColor: UIColor.beige.cgColor, borderWidth: 4, tapGestureRecog:tapgesture)
    }
    
    // MARK:- Deinitialize the observers
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @IBAction func segmntedSelect(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.signupstate = .clientState
        case 1:
            self.signupstate = .serviceProviderState
        default:
            print("do nothing")
        }
    }
    
    
    @IBAction func didTapImage(sender:UITapGestureRecognizer) {
        Alert.pushactionsheet(title: "Profile Photos", message: "Select a method of adding a profile photo.", preferredStyle: .actionSheet, control: self) { pickerState in
            
            switch pickerState {
            case .cameraphoto:
                self.viewModel!.pickCameraPhotoForProfile(control: self)
            case .photolibrary:
                self.viewModel!.pickLibraryPhotoForProfile(control: self)
            case .noImage:
                print("Do nothing")
            }
        }
    }
    
    
    

}

extension SignupViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.viewModel!.fetchMediaWithInfo(info: info, control: self)
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension SignupViewController:UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if signupstate == .clientState {
            guard !clientView.firstnameTextField.text!.isEmpty, clientView.firstnameTextField.text!.count > 0 else {
                print("Enter a first name.")
                return false
            }
            guard clientView.firstnameTextField.text?.isAlphanumeric as! Bool else {
                print("Enter only alpha-numeric characters.")
                return false
            }
            guard !clientView.lastnameTextField.text!.isEmpty, clientView.lastnameTextField.text!.count > 0 else {
                print("Enter a last name.")
                return false
            }
            guard clientView.lastnameTextField.text?.isAlphanumeric as! Bool else {
                print("Enter only alpha-numeric characters for lastname.")
                return false
            }
            guard !clientView.streetaddressTextField.text!.isEmpty as! Bool else {
                print("Enter an address.")
                return false
            }
            guard !clientView.cityandstateTextField.text!.isEmpty as! Bool else {
                print("Enter a city and state")
                return false
            }
            guard !clientView.zipcodeTextField.text!.isEmpty, clientView.zipcodeTextField.text!.count > 0 else {
                print("Enter a zip code")
                return false
            }
            guard clientView.zipcodeTextField.text?.count == 5 else {
                print("Enter a valid zip code that is 5 characters long.")
                return false
            }
            print("Mission accomplished")
        } else if signupstate == .serviceProviderState {
            
        }

        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1 {
//            let allowedChars = "0123456789"
//            let allowedCharacterSet = CharacterSet(charactersIn: allowedChars)
//            let charsFromTextField = CharacterSet(charactersIn: string)
//            return allowedCharacterSet.isSuperset(of: charsFromTextField)
            var newText = textField.text! as NSString
            newText = newText.replacingCharacters(in: range, with: string) as NSString

            let aSet = CharacterSet(charactersIn:"0123456789").inverted
            let compSepByCharInSet = string.components(separatedBy: aSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")

            return string == numberFiltered && newText.length <= 5
        }
        return true
    }
    
    
}

// MARK:- Notification functions
extension SignupViewController {
    
    
    
    @objc func keyboardWillChange(notification:Notification) {
        guard let keyboardRect = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }

        if (notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardDidChangeFrameNotification) {
            view.frame.origin.y = -keyboardRect.height + 110
        } else {
            view.frame.origin.y = 0
        }
    }
    
}
