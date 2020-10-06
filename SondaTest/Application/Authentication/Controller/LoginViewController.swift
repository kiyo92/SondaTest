//
//  LoginViewController.swift
//  SondaTest
//
//  Created by Joao Marcus Dionisio Araujo on 06/10/20.
//  Copyright © 2020 Joao Marcus Dionisio Araujo. All rights reserved.
//

import UIKit

@objc protocol LoginView: BaseView {
    @objc func validateCall()
    @objc func requestLogin(email: String, password: String)
    @objc func confirmAPIResponse(user: User)
}

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var loadingView: UIActivityIndicatorView!
    
    private let presenter: LoginPresenter = LoginPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.attach(view: self)
 
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.detach()
    }

    
    @IBAction func didTapLoginButton(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.validateCall()
        }
    }
}

// MARK: loginview control and UI actions
extension LoginViewController: LoginView {
    
    func validateCall() {
        if currentReachabilityStatus == .notReachable {
            showAlert(title: "Atenção", message: "Você está sem conexão à Internet.")
            return
        }
        
        if (emailTextField.text?.isEmpty)! {
            emailTextField.layer.borderColor = UIColor.red.cgColor
            _ = emailTextField.becomeFirstResponder()
            return
        }
        
        if (passwordTextField.text?.isEmpty)! {
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            _ = passwordTextField.becomeFirstResponder()
            return
        }
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        requestLogin(email: email, password: password)
    }
    
    func requestLogin(email: String, password: String) {
        
        
        presenter.loginWith(email: email, password: password)
        
    }
    
    func confirmAPIResponse(user: User) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UserStorage.user = user
            
            let controller = UIStoryboard.buildMainViewController()
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window!.rootViewController = controller
            appDelegate.window!.makeKeyAndVisible()
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func loading(show: Bool) {
        if (show) {
            loadingView.isHidden = false
            loginButton.isHidden = true
        } else {
            loadingView.isHidden = true
            loginButton.isHidden = false
        }
    }
}
