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
            self.client.removeProfileImageDelegate = controller as! RemoveProfileImageDelegate
        } else if signupState == .serviceProviderState {
            self.serviceProvider.removeProfileImageDelegate = controller as! RemoveProfileImageDelegate
            self.serviceProvider.businessnameTextField.delegate = controller as! UITextFieldDelegate
            self.serviceProvider.firstnameTextField.delegate = controller as! UITextFieldDelegate
            self.serviceProvider.lastnameTextField.delegate = controller as! UITextFieldDelegate
            self.serviceProvider.streetAddressTextField.delegate = controller as! UITextFieldDelegate
            self.serviceProvider.cityStateTextField.delegate = controller as! UITextFieldDelegate
            self.serviceProvider.phonenumberTextField.delegate = controller as! UITextFieldDelegate
            self.serviceProvider.emailTextField.delegate = controller as! UITextFieldDelegate
            self.serviceProvider.usernameTextField.delegate = controller as! UITextFieldDelegate
            self.serviceProvider.passwordTextField.delegate = controller as! UITextFieldDelegate
            self.serviceProvider.zipCodeTextField.delegate = controller as! UITextFieldDelegate
            
            
        }
       
    }
    
    

    
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
    
    public func validateSignupForm(handler:@escaping(_ result:Result<Bool, SignupError>) -> ()) {
        if signupState == .clientState {
            
        guard !client.firstnameTextField.text!.isEmpty, client.firstnameTextField.text!.count > 0 else {
            handler(.failure(.no_first_name))
                return
            }
            guard client.firstnameTextField.text?.isAlphanumeric as! Bool else {
                handler(.failure(.only_alphanumeric_chars))
                return
            }
            guard !client.lastnameTextField.text!.isEmpty, client.lastnameTextField.text!.count > 0 else {
                handler(.failure(.no_last_name))
                return
            }
            guard client.lastnameTextField.text?.isAlphanumeric as! Bool else {
                handler(.failure(.only_alphanumeric_chars))
                return
            }
            guard !client.streetaddressTextField.text!.isEmpty as! Bool else {
                handler(.failure(.no_street_address))
                return
            }
            guard !client.cityandstateTextField.text!.isEmpty as! Bool else {
                handler(.failure(.no_city_state))
                return
            }
            guard !client.zipcodeTextField.text!.isEmpty, client.zipcodeTextField.text!.count > 0 else {
                handler(.failure(.no_zip_code))
                return
            }
            guard client.zipcodeTextField.text?.count == 5 else {
                handler(.failure(.zip_code_is_too_short))
                return
            }
            guard !client.phonenumberTextField.text!.isEmpty, client.phonenumberTextField.text!.count > 0 else {
                handler(.failure(.no_phone_number))
                return
            }
            guard client.phonenumberTextField.text?.count == 13 else {
                handler(.failure(.need_13_characters))
                return
            }
            guard client.phonenumberTextField.text?.isPhoneNumberFormatted as! Bool else {
                handler(.failure(.is_phone_number_formatted))
                return
            }
            guard !client.emailTextField.text!.isEmpty, client.emailTextField.text!.count > 0 else {
                handler(.failure(.no_emailaddress))
                return
            }
            guard client.emailTextField.text?.isValidEmail as! Bool else {
                handler(.failure(.invalid_email_formatting))
                return
            }
            guard !client.usernameTextField.text!.isEmpty as! Bool, client.usernameTextField.text!.count > 0 else {
                handler(.failure(.no_username))
                return
            }
            guard client.usernameTextField.text?.isAlphanumeric as! Bool else {
                handler(.failure(.only_alpha_numeric_chars_username))
                return
            }
            guard client.usernameTextField.text!.count >= 4 else {
                handler(.failure(.username_must_have_4_chars))
                return
            }
            guard client.usernameTextField.text!.count <= 15 else {
                handler(.failure(.username_must_have_lessthan_15))
                return
            }
            guard !client.passwordTextField.text!.isEmpty, client.passwordTextField.text!.count > 0 else {
                handler(.failure(.no_password))
                return
            }
            guard client.passwordTextField.text!.count > 4 else {
                handler(.failure(.password_must_have_4_characters))
                return
            }
            guard client.passwordTextField.text!.doesHaveCapitalLetter else {
                handler(.failure(.password_must_have_capital_letter))
                return
            }
            guard client.passwordTextField.text!.isAlphanumeric else {
                print("The password must have ONLY alpha-numeric characters.")
                handler(.failure(.password_must_be_alpha_numeric))
                return
            }
            print("Client signup")
        }
        if signupState == .serviceProviderState {
            
            guard !serviceProvider.firstnameTextField.text!.isEmpty, serviceProvider.firstnameTextField.text!.count > 0 else {
                print("Enter a firstname.")
                return
            }
            guard !serviceProvider.lastnameTextField.text!.isEmpty, serviceProvider.lastnameTextField.text!.count > 0 else {
                print("Enter a lastname.")
                return
            }
            guard !serviceProvider.streetAddressTextField.text!.isEmpty, serviceProvider.streetAddressTextField.text!.count > 0 else {
                print("Enter an address.")
                return
            }
            guard !serviceProvider.zipCodeTextField.text!.isEmpty, serviceProvider.zipCodeTextField.text!.count > 0 else {
                print("Enter a zip code.")
                return
            }
            guard serviceProvider.zipCodeTextField.text!.count == 5 else {
                print("The zip code contains 5 characters. Please enter 5 characters.")
                return
            }
            guard !serviceProvider.cityStateTextField.text!.isEmpty, serviceProvider.cityStateTextField.text!.count > 0 else {
                print("Enter a city and state.")
                return
            }
            
            guard !serviceProvider.phonenumberTextField.text!.isEmpty, serviceProvider.phonenumberTextField.text!.count > 0 else {
                print("Enter a phone number.")
                return
            }
            
            guard serviceProvider.phonenumberTextField.text?.count == 13 else {
                print("The number of characters is off. Make sure that the number is properly formatted.")
                return
            }
            guard !serviceProvider.emailTextField.text!.isEmpty, serviceProvider.emailTextField.text!.count > 0  else {
                print("Enter an email address.")
                return
            }
            guard serviceProvider.emailTextField.text!.isValidEmail else {
                print("Enter a valid email.")
                return
            }
            guard !serviceProvider.usernameTextField.text!.isEmpty, serviceProvider.usernameTextField.text!.count > 0  else {
                print("Enter a username.")
                return
            }
            guard serviceProvider.usernameTextField.text!.isAlphanumeric else {
                print("Username must contain only alpha-numeric characters.")
                return
            }
            guard serviceProvider.usernameTextField.text!.count >= 4 else {
                print("Username must have at least 4 characters.")
                return
            }
            guard serviceProvider.usernameTextField.text!.count <= 15 else {
                print("The username must be less than 15 characters")
                return
            }
            guard !serviceProvider.passwordTextField.text!.isEmpty, serviceProvider.passwordTextField!.text!.count > 0 else {
                print("Enter a password.")
                return
            }
            guard serviceProvider.passwordTextField.text!.isAlphanumeric else {
                print("The password can only have alpha-numeric characters.")
                return
            }
            guard serviceProvider.passwordTextField.text!.count >= 4 else {
                print("The password must have at least 4 characters.")
                return
            }
            guard serviceProvider.passwordTextField.text!.doesHaveCapitalLetter else {
                print("The password must have at least one capital letter.")
                return
            }
            
            
            print("Mission accomplished")
            
            
        }
    }
    
    
}


