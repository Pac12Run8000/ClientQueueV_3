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
            print("Mission accomplished")
        } else if signupstate == .serviceProviderState {
            
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
