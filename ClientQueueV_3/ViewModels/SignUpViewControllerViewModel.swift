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
        } else if signupState == .serviceProviderState {
            
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
    
    public func validateForm(handler:@escaping(_ result:Bool) -> ()) {
        if signupState == .clientState {
            
        } else {
            
        }
    }
    
    
}


