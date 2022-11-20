//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Gilmar Junior on 20/11/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func openButtonTap(_ sender: Any) {
        let manager = UserManager(business: UserBusiness())
        
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            manager.login(email: email, password: password) { userModel in
                self.openHomeView()
            } failureHandler: { error in
                self.showMessage(title: "Erro", message: error?.localizedDescription ?? "")
            }
        }
    }
    
    @IBAction func registerButtonTap(_ sender: Any) {
        openRegister()
    }
    
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    func openHomeView() {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
    
    func openRegister() {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
}
