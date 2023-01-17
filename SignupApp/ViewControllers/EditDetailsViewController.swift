//
//  EditDetailsViewController.swift
//  SignupApp
//
//  Created by Yury on 16.01.23.
//

import UIKit

class EditDetailsViewController: UIViewController {
    
    // var to get username from Details VC
    var user: String!
    
    @IBOutlet var countryTF: UITextField!
    @IBOutlet var cityTF: UITextField!
    @IBOutlet var phoneTF: UITextField!
    @IBOutlet var lastNameTF: UITextField!
    @IBOutlet var firstNameTF: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding gradient to Edit Details screen
        addGradient()
        
        // MARK: Settings for text fields and buttons
        countryTF.clearButtonMode = .whileEditing
        countryTF.placeholder = "\(usersArray[user]?.country ?? "Your country")"
        countryTF.backgroundColor = .systemMint
        cityTF.clearButtonMode = .whileEditing
        cityTF.placeholder = "\(usersArray[user]?.city ?? "Your city")"
        cityTF.backgroundColor = .systemMint
        phoneTF.clearButtonMode = .whileEditing
        phoneTF.placeholder = "\(usersArray[user]?.phone ?? "Your phone number")"
        phoneTF.backgroundColor = .systemMint
        lastNameTF.clearButtonMode = .whileEditing
        lastNameTF.placeholder = "\(usersArray[user]?.lName ?? "Your surnamename")"
        lastNameTF.backgroundColor = .systemMint
        firstNameTF.clearButtonMode = .whileEditing
        firstNameTF.placeholder = "\(usersArray[user]?.fName ?? "Your name")"
        firstNameTF.backgroundColor = .systemMint
        
        // Setting buttons text color
        cancelButton.setTitleColor(.white, for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
    }
    
    // MARK: Prepare
    // Sending new values to Details VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as? DetailsViewController
        detailsVC?.firstName = firstNameTF.text
        detailsVC?.lastName = lastNameTF.text
        detailsVC?.phone = phoneTF.text
        detailsVC?.city = cityTF.text
        detailsVC?.country = countryTF.text
    }

    // MARK: Save button
    // Saving to usersArray new values
    @IBAction func saveTapped() {
        if !firstNameTF.text!.isEmpty { usersArray[user]?.fName = firstNameTF.text! }
        if !lastNameTF.text!.isEmpty { usersArray[user]?.lName = lastNameTF.text! }
        if !phoneTF.text!.isEmpty { usersArray[user]?.phone = phoneTF.text! }
        if !cityTF.text!.isEmpty { usersArray[user]?.city = cityTF.text! }
        if !countryTF.text!.isEmpty { usersArray[user]?.country = countryTF.text! }
    }
}

// MARK: Set backgound color
extension EditDetailsViewController {
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemTeal.cgColor, UIColor.systemIndigo.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
