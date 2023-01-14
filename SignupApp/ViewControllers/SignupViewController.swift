//
//  SignupViewController.swift
//  SignupApp
//
//  Created by Yury on 14.01.23.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: Text fields setiings
        usernameTF.clearButtonMode = .whileEditing
        usernameTF.placeholder = "Create username"
        usernameTF.autocorrectionType = .no
        passwordTF.clearButtonMode = .whileEditing
        passwordTF.placeholder = "Create password"
        passwordTF.isSecureTextEntry = true
        passwordTF.textContentType = .oneTimeCode
    }
    
    @IBAction func signupTapped() {
        performSegue(withIdentifier: "goToDashboardFromSignup", sender: nil)
    }
    
}

// MARK: Settings for keyboard
extension SignupViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTF {
            passwordTF.becomeFirstResponder()
        } else {
            signupTapped()
        }
        return true
    }
}
