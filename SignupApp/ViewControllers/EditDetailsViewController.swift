//
//  EditDetailsViewController.swift
//  SignupApp
//
//  Created by Yury on 16.01.23.
//

import UIKit

class EditDetailsViewController: UIViewController {
    
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
        
        addGradient()
        
        countryTF.clearButtonMode = .whileEditing
        countryTF.placeholder = "Your country"
        countryTF.backgroundColor = .systemMint
        cityTF.clearButtonMode = .whileEditing
        cityTF.placeholder = "Your city"
        cityTF.backgroundColor = .systemMint
        phoneTF.clearButtonMode = .whileEditing
        phoneTF.placeholder = "Your phone number"
        phoneTF.backgroundColor = .systemMint
        lastNameTF.clearButtonMode = .whileEditing
        lastNameTF.placeholder = "Your surname name"
        lastNameTF.backgroundColor = .systemMint
        firstNameTF.clearButtonMode = .whileEditing
        firstNameTF.placeholder = "Your name"
        firstNameTF.backgroundColor = .systemMint
        
        cancelButton.setTitleColor(.white, for: .normal)
        
        saveButton.setTitleColor(.white, for: .normal)
        
        view.backgroundColor = .systemTeal
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as? DetailsViewController
        detailsVC?.firstName = firstNameTF.text
        detailsVC?.lastName = lastNameTF.text
        detailsVC?.phone = phoneTF.text
        detailsVC?.city = cityTF.text
        detailsVC?.country = countryTF.text
    }

    @IBAction func saveTapped() {
        if !firstNameTF.text!.isEmpty { usersArray[user]?.fName = firstNameTF.text! }
        if !lastNameTF.text!.isEmpty { usersArray[user]?.lName = lastNameTF.text! }
        if !phoneTF.text!.isEmpty { usersArray[user]?.phone = phoneTF.text! }
        if !cityTF.text!.isEmpty { usersArray[user]?.city = cityTF.text! }
        if !countryTF.text!.isEmpty { usersArray[user]?.country = countryTF.text! }
    }
}

extension EditDetailsViewController {
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemTeal.cgColor, UIColor.systemIndigo.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
