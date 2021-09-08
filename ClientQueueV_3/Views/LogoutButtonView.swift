//
//  LogoutButtonView.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 9/8/21.
//

import UIKit
import FirebaseAuth

class LogoutButtonView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var button: UIButton!
    
    weak var logoutdelegate:LogoutDelegate!
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        view = loadViewFromNib(nibname: "LogoutButtonView")
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        let title = isAuthenticated() == true ? "Logout" : "Not logged In"
        button.setTitle(title, for: .normal)
        addSubview(view)
    }
    
    func isAuthenticated() -> Bool {
        return Auth.auth().currentUser?.uid != nil
    }
    
    
    func loadViewFromNib(nibname:String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibname, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    

    @IBAction func logoutBtnAction(_ sender: UIButton) {
        logoutdelegate.logout()
    }
}
