//
//  ViewController.swift
//  SignupApp
//
//  Created by Yury on 14.01.23.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var usernameTF: UITextField!
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // settings for textfields
        usernameTF.clearButtonMode = .whileEditing
        usernameTF.placeholder = "Enter username"
        usernameTF.autocorrectionType = .no
        passwordTF.clearButtonMode = .whileEditing
        passwordTF.placeholder = "Enter password"
        passwordTF.isSecureTextEntry = true
        passwordTF.textContentType = .oneTimeCode
    }
    
    // Sending data to other VCs
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabbarVC = segue.destination as? UITabBarController
        let dashboardVC = tabbarVC?.viewControllers?.first as? DashboardViewController
        dashboardVC?.user = usernameTF.text
        
        let detailsVC = tabbarVC?.viewControllers?[1] as? DetailsViewController
        guard let usernameText = usernameTF.text else { return }
        guard let user = usersArray[usernameText] else { return }
        detailsVC?.username = usernameTF.text
        detailsVC?.firstName = user.fName
        detailsVC?.lastName = user.lName
        detailsVC?.phone = user.phone
        detailsVC?.city = user.city
        detailsVC?.country = user.country
    }

    // MARK: IBActions
    // Login button
    @IBAction func loginTapped() {
        // Checking that text fields is not empty
        guard let usernameText = usernameTF.text, let passwordText = passwordTF.text else { return }
        guard !usernameText.isEmpty && !passwordText.isEmpty else {
            showAlert(title: "Oops!", message: "Please enter username and password 😀")
            passwordTF.text = nil
            return
        }
        // Checking for valid username and password
        guard checkLoginAndPassword() else {
            // If not - showing alert
            showAlert(title: "Invalid login or password", message: "Please enter correct login and password")
            passwordTF.text = nil
            return
        }
        // If right - going to the DashboardVC
        performSegue(withIdentifier: "goToDashboardFromLogin", sender: nil)
    }
    
    // Signup button
    @IBAction func signupTapped() {
        performSegue(withIdentifier: "goToSignup", sender: nil)
    }
    
    // Returning to this VC from previous VC
    @IBAction func unwindSegueToLoginVC(segue: UIStoryboardSegue) {
        usernameTF.text = nil
        passwordTF.text = nil
    }
}

// MARK: Public Methods
// Settings for keyboard
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

// Alert window
extension LoginViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "OK", style: .default)
        alert.addAction(buttonOK)
        present(alert, animated: true)
    }
}

// Checking username and password to login
extension LoginViewController {
    func checkLoginAndPassword() -> Bool {
        guard let usernameText = usernameTF.text else { return false }
        if let user = usersArray[usernameText] {
            if user.password == passwordTF.text {
                return true
            }
        }
        return false
    }
}
