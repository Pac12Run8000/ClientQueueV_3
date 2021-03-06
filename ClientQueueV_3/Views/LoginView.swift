//
//  LoginView.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/5/21.
//

import UIKit

class LoginView: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    weak var forgotLoginDelegate:ForgotLoginDelegate!
    weak var signupDelegate:SignupDelegate!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        view = loadViewFromNib(nibName: "LoginView")
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        emailTextField.layer.masksToBounds = true
        passwordTextField.layer.masksToBounds = true
        view.layer.backgroundColor = UIColor.lightGreen.cgColor
        addSubview(view)
    }
    
    
    func loadViewFromNib(nibName:String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    
    
    @IBAction func forgotLoginAction(_ sender: UIButton) {
        forgotLoginDelegate.fetchLogin()
    }
    
    
    @IBAction func signupAction(_ sender: UIButton) {
        signupDelegate.fetchSignup()
    }
    
}
