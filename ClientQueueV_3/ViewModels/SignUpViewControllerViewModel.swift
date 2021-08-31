//
//  SignUpViewControllerViewModel.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/19/21.
//

import UIKit

struct SignUpViewControllerViewModel {
    
    var signupState:SignupState?
    var client:ClientSignupView
    var serviceProvider:SPSignupView
    var controller:UIViewController
    
    init(signupState:SignupState, client:ClientSignupView, serviceProvider:SPSignupView, controller:UIViewController) {
        self.signupState = signupState
        self.client = client
        self.serviceProvider = serviceProvider
        self.controller = controller
        if signupState == .clientState {
            self.client.firstnameTextField.delegate = controller as! UITextFieldDelegate
            self.client.lastnameTextField.delegate = controller as! UITextFieldDelegate
            self.client.streetaddressTextField.delegate = controller as! UITextFieldDelegate
            self.client.zipcodeTextField.delegate = controller as! UITextFieldDelegate
            self.client.cityandstateTextField.delegate = controller as! UITextFieldDelegate
            self.client.phonenumberTextField.delegate = controller as! UITextFieldDelegate
            self.client.emailTextField.delegate = controller as! UITextFieldDelegate
            self.client.usernameTextField.delegate = controller as! UITextFieldDelegate
            self.client.passwordTextField.delegate = controller as! UITextFieldDelegate
            self.client.remDelegate = controller as! RemoveProfileImageDelegate
        } else if signupState == .serviceProviderState {
            
        }
       
    }
    
    
    
    
//    func clientFormFunctionalityViewModel() -> Bool {
//        guard !client.firstnameTextField.text!.isEmpty, client.firstnameTextField.text!.count > 0 else {
//            print("Enter a first name.")
//            return false
//        }
//        guard client.firstnameTextField.text?.isAlphanumeric as! Bool else {
//            print("Enter only alpha-numeric characters.")
//            return false
//        }
//        guard !client.lastnameTextField.text!.isEmpty, client.lastnameTextField.text!.count > 0 else {
//            print("Enter a last name.")
//            return false
//        }
//        guard client.lastnameTextField.text?.isAlphanumeric as! Bool else {
//            print("Enter only alpha-numeric characters for lastname.")
//            return false
//        }
//        guard !client.streetaddressTextField.text!.isEmpty as! Bool else {
//            print("Enter an address.")
//            return false
//        }
//        guard !client.cityandstateTextField.text!.isEmpty as! Bool else {
//            print("Enter a city and state")
//            return false
//        }
//        guard !client.zipcodeTextField.text!.isEmpty, client.zipcodeTextField.text!.count > 0 else {
//            print("Enter a zip code")
//            return false
//        }
//        guard client.zipcodeTextField.text?.count == 5 else {
//            print("Enter a valid zip code that is 5 characters long.")
//            return false
//        }
//        guard !client.phonenumberTextField.text!.isEmpty, client.phonenumberTextField.text!.count > 0 else {
//            print("Enter a phone number")
//            return false
//        }
//        guard client.phonenumberTextField.text?.count == 13 else {
//            print("The phone number is incomplete. Add more numbers.")
//            return false
//        }
//        guard client.phonenumberTextField.text?.isPhoneNumberFormatted as! Bool else {
//            print("The phone number is improperly formatted.")
//            return false
//        }
//        guard !client.emailTextField.text!.isEmpty, client.emailTextField.text!.count > 0 else {
//            print("Enter an email address.")
//            return false
//        }
//        guard client.emailTextField.text?.isValidEmail as! Bool else {
//            print("The email formatted improperly.")
//            return false
//        }
//        guard !client.usernameTextField.text!.isEmpty as! Bool, client.usernameTextField.text!.count > 0 else {
//            print("Enter a username.")
//            return false
//        }
//        guard client.usernameTextField.text?.isAlphanumeric as! Bool else {
//            print("Enter only alpha-numeric characters for the username.")
//            return false
//        }
//        guard client.usernameTextField.text!.count >= 4 else {
//            print("Username must have at least 4 characters.")
//            return false
//        }
//        guard client.usernameTextField.text!.count <= 15 else {
//            print("Username must have less than 15 characters.")
//            return false
//        }
//        guard !client.passwordTextField.text!.isEmpty, client.passwordTextField.text!.count > 0 else {
//            print("Enter a password.")
//            return false
//        }
//        guard  client.passwordTextField.text!.count > 4 else {
//            print("Password needs to be entered and must be longer than 4 characters.")
//            return false
//        }
//        guard client.passwordTextField.text!.doesHaveCapitalLetter else {
//            print("The password must have at least one capital letter.")
//            return false
//        }
//        guard client.passwordTextField.text!.isAlphanumeric else {
//            print("The password must have ONLY alpha-numeric characters.")
//            return false
//        }
//
//        return true
//    }
    
    
    func fetchMediaWithInfo(info:[UIImagePickerController.InfoKey : Any], control:SignupViewController) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            control.profileImageView.image = editedImage
            
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            control.profileImageView.image = originalImage
        }
    }
    
    func pickCameraPhotoForProfile(control:SignupViewController) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            control.imgPickerController.sourceType = .camera
            control.present(control.imgPickerController, animated: true, completion: nil)
        } else {
            Alert.pushErrorAlert(msg: ProfileImageError.cameraIsNotAvailable.description, control: control)
        }
    }
    
    func pickLibraryPhotoForProfile(control:SignupViewController) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            control.imgPickerController.sourceType = .photoLibrary
            control.present(control.imgPickerController, animated: true, completion: nil)
        } else {
            Alert.pushErrorAlert(msg: ProfileImageError.photoLibraryIsNotAvailable.description, control: control)
        }
    }
    
    func fetchFormForSignup(completionHandler:@escaping(_ clientAlpha:CGFloat,_ spAlpha:CGFloat) -> ()) {
        if self.signupState == .clientState {
            completionHandler(1.0, 0.0)
        } else {
            completionHandler(0.0, 1.0)
        }
        
    }
    
    public func validateSignupForm(handler:@escaping(_ result:Bool) -> ()) {
        if signupState == .clientState {
            guard !client.firstnameTextField.text!.isEmpty, client.firstnameTextField.text!.count > 0 else {
                    print("Enter a first name.")
                    return
                }
                guard client.firstnameTextField.text?.isAlphanumeric as! Bool else {
                    print("Enter only alpha-numeric characters.")
                    return
                }
                guard !client.lastnameTextField.text!.isEmpty, client.lastnameTextField.text!.count > 0 else {
                    print("Enter a last name.")
                    return
                }
                guard client.lastnameTextField.text?.isAlphanumeric as! Bool else {
                    print("Enter only alpha-numeric characters for lastname.")
                    return
                }
                guard !client.streetaddressTextField.text!.isEmpty as! Bool else {
                    print("Enter an address.")
                    return
                }
                guard !client.cityandstateTextField.text!.isEmpty as! Bool else {
                    print("Enter a city and state")
                    return
                }
                guard !client.zipcodeTextField.text!.isEmpty, client.zipcodeTextField.text!.count > 0 else {
                    print("Enter a zip code")
                    return
                }
                guard client.zipcodeTextField.text?.count == 5 else {
                    print("Enter a valid zip code that is 5 characters long.")
                    return
                }
                guard !client.phonenumberTextField.text!.isEmpty, client.phonenumberTextField.text!.count > 0 else {
                    print("Enter a phone number")
                    return
                }
                guard client.phonenumberTextField.text?.count == 13 else {
                    print("The number of characters is off. Make sure that the number is properly formatted.")
                    return
                }
                guard client.phonenumberTextField.text?.isPhoneNumberFormatted as! Bool else {
                    print("The phone number is improperly formatted.")
                    return
                }
                guard !client.emailTextField.text!.isEmpty, client.emailTextField.text!.count > 0 else {
                    print("Enter an email address.")
                    return
                }
                guard client.emailTextField.text?.isValidEmail as! Bool else {
                    print("The email formatted improperly.")
                    return
                }
                guard !client.usernameTextField.text!.isEmpty as! Bool, client.usernameTextField.text!.count > 0 else {
                    print("Enter a username.")
                    return
                }
                guard client.usernameTextField.text?.isAlphanumeric as! Bool else {
                    print("Enter only alpha-numeric characters for the username.")
                    return
                }
                guard client.usernameTextField.text!.count >= 4 else {
                    print("Username must have at least 4 characters.")
                    return
                }
                guard client.usernameTextField.text!.count <= 15 else {
                    print("Username must have less than 15 characters.")
                    return
                }
                guard !client.passwordTextField.text!.isEmpty, client.passwordTextField.text!.count > 0 else {
                    print("Enter a password.")
                    return
                }
                guard  client.passwordTextField.text!.count > 4 else {
                    print("Password needs to be entered and must be longer than 4 characters.")
                    return
                }
                guard client.passwordTextField.text!.doesHaveCapitalLetter else {
                    print("The password must have at least one capital letter.")
                    return
                }
                guard client.passwordTextField.text!.isAlphanumeric else {
                    print("The password must have ONLY alpha-numeric characters.")
                    return
                }
                print("Mission accomplished")
        } else {
            
        }
    }
    
    
}


