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
    
    public func validateSignupForm(profileImage:UIImage, handler:@escaping(_ result:Result<[String:AnyObject], SignupError>) -> ()) {
        if signupState == .clientState {
            
        guard !client.firstnameTextField.text!.isEmpty, client.firstnameTextField.text!.count > 0 else {
            handler(.failure(.client_no_first_name))
                return
            }
            
            guard !client.lastnameTextField.text!.isEmpty, client.lastnameTextField.text!.count > 0 else {
                handler(.failure(.client_no_last_name))
                return
            }
            guard client.lastnameTextField.text?.isAlphanumeric as! Bool else {
                handler(.failure(.client_only_alphanumeric_chars_for_lastname))
                return
            }
            guard !client.streetaddressTextField.text!.isEmpty as! Bool else {
                handler(.failure(.client_no_street_address))
                return
            }
            guard !client.cityandstateTextField.text!.isEmpty as! Bool else {
                handler(.failure(.client_no_city_state))
                return
            }
            guard !client.zipcodeTextField.text!.isEmpty, client.zipcodeTextField.text!.count > 0 else {
                handler(.failure(.client_no_zip_code))
                return
            }
            guard client.zipcodeTextField.text?.count == 5 else {
                handler(.failure(.client_zip_code_is_too_short))
                return
            }
            guard !client.phonenumberTextField.text!.isEmpty, client.phonenumberTextField.text!.count > 0 else {
                handler(.failure(.client_no_phone_number))
                return
            }
            guard client.phonenumberTextField.text?.count == 13 else {
                handler(.failure(.client_need_13_characters))
                return
            }
            guard client.phonenumberTextField.text?.isPhoneNumberFormatted as! Bool else {
                handler(.failure(.client_is_phone_number_formatted))
                return
            }
            guard !client.emailTextField.text!.isEmpty, client.emailTextField.text!.count > 0 else {
                handler(.failure(.client_no_emailaddress))
                return
            }
            guard client.emailTextField.text?.isValidEmail as! Bool else {
                handler(.failure(.client_invalid_email_formatting))
                return
            }
            guard !client.usernameTextField.text!.isEmpty as! Bool, client.usernameTextField.text!.count > 0 else {
                handler(.failure(.client_no_username))
                return
            }
            guard client.usernameTextField.text?.isAlphanumeric as! Bool else {
                handler(.failure(.client_only_alpha_numeric_chars_username))
                return
            }
            guard client.usernameTextField.text!.count >= 4 else {
                handler(.failure(.client_username_must_have_4_chars))
                return
            }
            guard client.usernameTextField.text!.count <= 15 else {
                handler(.failure(.client_username_must_have_lessthan_15))
                return
            }
            guard !client.passwordTextField.text!.isEmpty, client.passwordTextField.text!.count > 0 else {
                handler(.failure(.client_no_password))
                return
            }
            guard client.passwordTextField.text!.count > 4 else {
                handler(.failure(.client_password_must_have_4_characters))
                return
            }
            guard client.passwordTextField.text!.doesHaveCapitalLetter else {
                handler(.failure(.client_password_must_have_capital_letter))
                return
            }
            guard client.passwordTextField.text!.isAlphanumeric else {
                print("The password must have ONLY alpha-numeric characters.")
                handler(.failure(.client_password_must_be_alpha_numeric))
                return
            }
            handler(.success(["firstname":client.firstnameTextField.text as! AnyObject, "lastname": client.lastnameTextField.text as! AnyObject, "gender": GenderType(rawValue: client.segmentedGenderControl.selectedSegmentIndex)?.description as! AnyObject, "address": client.streetaddressTextField.text as! AnyObject, "userType": UserType.client.description as! AnyObject, "cityState": client.cityandstateTextField.text as! AnyObject, "zipCode":client.zipcodeTextField.text as! AnyObject, "phone":client.phonenumberTextField.text as! AnyObject, "email":client.emailTextField.text as! AnyObject, "username":client.usernameTextField.text as! AnyObject, "password":client.passwordTextField.text as! AnyObject,
                              "profileImage": profileImage as AnyObject]))
        }
        if signupState == .serviceProviderState {
            
            guard !serviceProvider.firstnameTextField.text!.isEmpty, serviceProvider.firstnameTextField.text!.count > 0 else {
                handler(.failure(.service_provider_no_firstname))
                return
            }
            guard !serviceProvider.lastnameTextField.text!.isEmpty, serviceProvider.lastnameTextField.text!.count > 0 else {
                handler(.failure(.service_provider_no_lastname))
                return
            }
            guard !serviceProvider.streetAddressTextField.text!.isEmpty, serviceProvider.streetAddressTextField.text!.count > 0 else {
                handler(.failure(.service_provider_no_address))
                return
            }
            guard !serviceProvider.zipCodeTextField.text!.isEmpty, serviceProvider.zipCodeTextField.text!.count > 0 else {
                handler(.failure(.service_provider_no_zipcode))
                return
            }
            guard serviceProvider.zipCodeTextField.text!.count == 5 else {
                handler(.failure(.service_provider_zipcode_has_5_characters))
                return
            }
            guard !serviceProvider.cityStateTextField.text!.isEmpty, serviceProvider.cityStateTextField.text!.count > 0 else {
                handler(.failure(.service_provider_no_city_state))
                return
            }
            
            guard !serviceProvider.phonenumberTextField.text!.isEmpty, serviceProvider.phonenumberTextField.text!.count > 0 else {
                handler(.failure(.service_provider_no_phone_number))
                return
            }
            
            guard serviceProvider.phonenumberTextField.text?.count == 13 else {
                handler(.failure(.service_provider_phone_number_has_bad_formatting))
                return
            }
            guard !serviceProvider.emailTextField.text!.isEmpty, serviceProvider.emailTextField.text!.count > 0  else {
                handler(.failure(.service_provider_no_email))
                return
            }
            guard serviceProvider.emailTextField.text!.isValidEmail else {
                handler(.failure(.service_provider_invalid_email))
                return
            }
            guard !serviceProvider.usernameTextField.text!.isEmpty, serviceProvider.usernameTextField.text!.count > 0  else {
                handler(.failure(.service_provider_no_username))
                return
            }
            guard serviceProvider.usernameTextField.text!.isAlphanumeric else {
                handler(.failure(.service_provider_only_alpha_numeric_characters_in_username))
                return
            }
            guard serviceProvider.usernameTextField.text!.count >= 4 else {
                handler(.failure(.service_provider_username_must_have_4_characters))
                return
            }
            guard serviceProvider.usernameTextField.text!.count <= 15 else {
                handler(.failure(.service_provider_username_less_than_15_characters))
                return
            }
            guard !serviceProvider.passwordTextField.text!.isEmpty, serviceProvider.passwordTextField!.text!.count > 0 else {
                handler(.failure(.service_provider_no_password))
                return
            }
            guard serviceProvider.passwordTextField.text!.isAlphanumeric else {
                handler(.failure(.service_provider_password_isAlpa_numeric))
                return
            }
            guard serviceProvider.passwordTextField.text!.count >= 4 else {
                handler(.failure(.service_provider_password_4_characters))
                return
            }
            guard serviceProvider.passwordTextField.text!.doesHaveCapitalLetter else {
                handler(.failure(.service_provider_password_capital_letter))
                return
            }
//            handler(.success(.serviceProvider))
            var dictionary = [String:AnyObject]()
            if !serviceProvider.businessnameTextField.text!.isEmpty && (serviceProvider.businessnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).count)! > 0 {
                dictionary["businessName"] = serviceProvider.businessnameTextField.text as! AnyObject
            }
            dictionary["firstname"] = serviceProvider.firstnameTextField.text as! AnyObject
            dictionary["lastname"] = serviceProvider.lastnameTextField.text as! AnyObject
            dictionary["address"] = serviceProvider.streetAddressTextField.text as! AnyObject
            dictionary["zipCode"] = serviceProvider.zipCodeTextField.text as! AnyObject
            dictionary["cityState"] = serviceProvider.cityStateTextField.text as! AnyObject
//            GenderType(rawValue: client.segmentedGenderControl.selectedSegmentIndex)?.description as! AnyObject
            dictionary["gender"] = GenderType(rawValue: serviceProvider.genderSegmentedControl.selectedSegmentIndex)?.description as! AnyObject
            dictionary["phone"] = serviceProvider.phonenumberTextField.text as! AnyObject
            dictionary["email"] = serviceProvider.emailTextField.text as! AnyObject
            dictionary["username"] = serviceProvider.usernameTextField.text as! AnyObject
            dictionary["password"] = serviceProvider.passwordTextField.text as! AnyObject
            dictionary["userType"] = UserType.serviceProvider.description as! AnyObject
            dictionary["profileImage"] = profileImage as AnyObject
            handler(.success(dictionary))
        }
    }
    
    
}


