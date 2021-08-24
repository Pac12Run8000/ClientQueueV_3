//
//  KeyboardObserver.swift
//  ClientQueueV_3
//
//  Created by Michelle Grover on 8/23/21.
//

import UIKit

class KeyboardObserver {
   
    private var onShowHandler: ((_ keyboardFrame:CGRect) -> ())?
    private var onHideHandler: (() -> ())?
    
    init(onShow: @escaping(_ keyboardFrame:CGRect) -> (), onHide: @escaping() -> ()) {
        self.onShowHandler = onShow
        self.onHideHandler = onHide
    }
    
    private func startObserving() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func handleKeyboardWillShow(notification:Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        onShowHandler!(keyboardFrame)
    }
    
    @objc private func handleKeyboardWillHide(notification:Notification) {
        onHideHandler!()
    }
    
    func stopObserving() {
        NotificationCenter.default.removeObserver(self)
        onShowHandler = nil
        onHideHandler = nil
    }
}

protocol KeyboardObservable:AnyObject {
    var keyboardObserver:KeyboardObserver? { get set }
    func startKeyboardObserving(onShow:@escaping(_ keyboardFrame:CGRect) -> (), onHide: @escaping () -> ())
    func stopKeyboardObserving()
}

extension KeyboardObservable {
    func startKeyboardObserving(onShow: @escaping (_ keyboardFrame:CGRect) -> (), onHide: @escaping() -> ()) {
        keyboardObserver = KeyboardObserver(onShow: onShow, onHide: onHide)
    }
    
    func stopKeyboardObserving() {
        keyboardObserver?.stopObserving()
        keyboardObserver = nil
    }
}
