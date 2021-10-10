//
//  LoginController.swift
//  priver
//
//  Created by ANA on 10/6/21.
//

import UIKit

class LoginController: UIViewController{
    
    /*Variable Outlet*/
    @IBOutlet var anchorContentCenterY: NSLayoutConstraint!
    @IBOutlet weak var viewContent: UIView!
    
    /*Variable Action*/
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    /*Método que sale en todo Controller*/

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*Métodos para el Keyboard*/
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardEvents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardEvents()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    /* Navegar a la pantalla Forgot Password*/
    
    @IBAction func didTapForgotPasswordButton(sender: UIButton){
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotController") else{
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /* Navegar a la pantalla Create Account*/
    
    @IBAction func didTapCreateOneButton(sender: UIButton){
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateAccountController") else{
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /* Navegar a la pantalla anterior*/
    
    @IBAction func didTapBackButton(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
}

/*Eventos de teclado*/

extension LoginController{
    
    func registerKeyboardEvents(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
    }
    
    func unregisterKeyboardEvents(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification){
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        let finalPosYContent = self.viewContent.frame.origin.y + self.viewContent.frame.height
        
        if keyboardFrame.origin.y < finalPosYContent {
            
            UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut], animations: {
                self.anchorContentCenterY.constant = keyboardFrame.origin.y - finalPosYContent
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification){
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.anchorContentCenterY.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
}
