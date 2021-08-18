//
//  imageView+extension.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/17/21.
//

import UIKit

extension UIImageView {
    
    func configureProfileImageView(borderColor:CGColor, borderWidth:CGFloat, tapGestureRecog:UITapGestureRecognizer) {
        self.layer.cornerRadius = self.layer.frame.size.width / 2
        self.layer.masksToBounds = true
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecog)
    }
}
