//
//  SignupViewController.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/11/21.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    var imgPickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgPickerController.delegate = self
        imgPickerController.allowsEditing = true
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(didTapImage(sender:)))
        profileImageView.configureProfileImageView(borderColor: UIColor.beige.cgColor, borderWidth: 4, tapGestureRecog:tapgesture)

    }
    
    @IBAction func didTapImage(sender:UITapGestureRecognizer) {
        Alert.pushactionsheet(title: "Profile Photos", message: "Select a methid of adding a profile photo.", preferredStyle: .actionSheet, control: self) { pickerState in
            
            switch pickerState {
            case .cameraphoto:
                SignUpViewControllerViewModel().pickCameraPhotoForProfile(control: self)
            case .photolibrary:
                SignUpViewControllerViewModel().pickLibraryPhotoForProfile(control: self)
            case .noImage:
                print("Do nothing")
            }
        }

    }
    
    
    

}

extension SignupViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        SignUpViewControllerViewModel().fetchMediaWithInfo(info: info, control: self)
        picker.dismiss(animated: true, completion: nil)
    }
    
}
