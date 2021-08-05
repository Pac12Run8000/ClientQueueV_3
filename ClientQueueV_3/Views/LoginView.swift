//
//  LoginView.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/5/21.
//

import UIKit

@IBDesignable class LoginView: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBInspectable var txtFldBWidth:CGFloat = 0 {
        didSet {
            usernameTextField.layer.borderWidth = txtFldBWidth
            passwordTextField.layer.borderWidth = txtFldBWidth
        }
    }
    
    @IBInspectable var cRadius:CGFloat = 1 {
        didSet {
            usernameTextField.layer.cornerRadius = cRadius
            passwordTextField.layer.cornerRadius = cRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override class func prepareForInterfaceBuilder() {
        
    }
    
    private func commonInit() {
        view = loadViewFromNib(nibName: "LoginView")
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        usernameTextField.layer.masksToBounds = true
        passwordTextField.layer.masksToBounds = true
        addSubview(view)
    }
    
    func loadViewFromNib(nibName:String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    

}
