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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabbarVC = segue.destination as? UITabBarController
        let dashboardVC = tabbarVC?.viewControllers?.first as? DashboardViewController
        dashboardVC?.user = usernameTF.text
        
        let detailsVC = tabbarVC?.viewControllers![1] as? DetailsViewController
        guard let user = usersArray[usernameTF.text!] else { return }
        detailsVC?.username = usernameTF.text
        detailsVC?.firstName = user.fName
        detailsVC?.lastName = user.lName
        detailsVC?.phone = user.phone
        detailsVC?.city = user.city
        detailsVC?.country = user.country
    }
    
    @IBAction func signupTapped() {
        guard !usernameTF.text!.isEmpty && !passwordTF.text!.isEmpty else {
            showAlert(title: "Oops!", message: "Please fillout username and password fields 😀")
            passwordTF.text = nil
            return
        }
        if let _ = usersArray[usernameTF.text!] {
            showAlert(title: "Username is taken", message: "Please enter another username")
            return
        }
        usersArray[usernameTF.text!] = Details(password: passwordTF.text)
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

// MARK: Alert window
extension SignupViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "OK", style: .default)
        alert.addAction(buttonOK)
        present(alert, animated: true)
    }
}
