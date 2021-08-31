//
//  ClientSignupView.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/20/21.
//

import UIKit

class ClientSignupView: UIView {
    
    weak var removeProfileImageDelegate:RemoveProfileImageDelegate?

    @IBOutlet var view: UIView!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var phonenumberTextField: UITextField!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var streetaddressTextField: UITextField!
    @IBOutlet weak var cityandstateTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var zipcodeTextField: UITextField!
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        commonInti()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInti()
    }
    
    private func commonInti() {
        view = loadViewFromNib(nibName: "ClientSignupView")
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        view.layer.backgroundColor = UIColor.lightGreen.cgColor
        addSubview(view)
    }
    
    private func loadViewFromNib(nibName:String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view!
    }
    
    @IBAction func clearBtnAction(_ sender: UIButton) {
        self.firstnameTextField.text = ""
        self.lastnameTextField.text = ""
        self.streetaddressTextField.text = ""
        self.cityandstateTextField.text = ""
        self.zipcodeTextField.text = ""
        self.phonenumberTextField.text = ""
        self.emailTextField.text = ""
        self.usernameTextField.text = ""
        self.passwordTextField.text = ""
        
        self.removeProfileImageDelegate?.resetProfileImage()
        
    }
    
}


