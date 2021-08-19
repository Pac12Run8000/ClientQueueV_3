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
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    self.imgPickerController.sourceType = .camera
                    self.present(self.imgPickerController, animated: true, completion: nil)
                } else {
                    Alert.pushErrorAlert(msg: ProfileImageError.cameraIsNotAvailable.description, control: self)
                }
            case .photolibrary:
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    self.imgPickerController.sourceType = .photoLibrary
                    self.present(self.imgPickerController, animated: true, completion: nil)
                } else {
                    Alert.pushErrorAlert(msg: ProfileImageError.photoLibraryIsNotAvailable.description, control: self)
                }
               
            case .noImage:
                print("Do nothing")
            }
        }

    }
    
    
    

}

extension SignupViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profileImageView.image = editedImage
            
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageView.image = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}
