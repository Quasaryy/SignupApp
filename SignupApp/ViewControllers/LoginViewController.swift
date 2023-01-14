//
//  ViewController.swift
//  SignupApp
//
//  Created by Yury on 14.01.23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var usernameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Settings for textfields
        usernameTF.clearButtonMode = .whileEditing
        usernameTF.placeholder = "Enter username"
        usernameTF.autocorrectionType = .no
        passwordTF.clearButtonMode = .whileEditing
        passwordTF.placeholder = "Enter password"
        passwordTF.isSecureTextEntry = true
        passwordTF.textContentType = .oneTimeCode
    }

    @IBAction func loginTapped() {
        performSegue(withIdentifier: "goToDashboardFromLogin", sender: nil)
    }
    
    @IBAction func signupTapped() {
        performSegue(withIdentifier: "goToSignup", sender: nil)
    }
    
    // MARK: Returning to this VC from previous VC
    @IBAction func unwindSegueToFirstVC(segue: UIStoryboardSegue) {
        
    }
}

// MARK: Settings for keyboard
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginTapped()
        }
        return true
    }
}

