//
//  SPSignupView.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/22/21.
//

import UIKit

class SPSignupView: UIView {
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var businessnameTextField: UITextField!
    
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

}
