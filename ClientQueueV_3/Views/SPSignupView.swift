//
//  SPSignupView.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/22/21.
//

import UIKit

class SPSignupView: UIView {
    
    weak var removeProfileImageDelegate:RemoveProfileImageDelegate?
    
    @IBOutlet var view: UIView!
    
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var businessnameTextField: UITextField!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityStateTextField: UITextField!
    @IBOutlet weak var phonenumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        view = loadViewFromNib(nibName: "SPSignupView")
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        view.backgroundColor = UIColor.lightGreen
        addSubview(view)
    }
    
    func loadViewFromNib(nibName:String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    @IBAction func resetBtnAction(_ sender: Any) {
        removeProfileImageDelegate?.resetProfileImage()
        self.businessnameTextField.text = ""
        self.firstnameTextField.text = ""
        self.lastnameTextField.text = ""
        self.streetAddressTextField.text = ""
        self.zipCodeTextField.text = ""
        self.cityStateTextField.text = ""
        self.phonenumberTextField.text = ""
        self.emailTextField.text = ""
        self.usernameTextField.text = ""
        self.passwordTextField.text = ""
    }
    

}
