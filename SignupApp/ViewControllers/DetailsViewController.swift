//
//  DetailsViewController.swift
//  SignupApp
//
//  Created by Yury on 15.01.23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // vars to get data from other VCs
    var firstName: String!
    var lastName: String!
    var phone: String!
    var city: String!
    var country: String!
    var username: String!

    @IBOutlet var userDetails: UILabel!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameLabel.text = firstName
        lastNameLabel.text = lastName
        phoneLabel.text = phone
        cityLabel.text = city
        countryLabel.text = country
        
        // Adding gradient for Details screen
        addGradient()
    }
    
    // MARK: Prepare
    // Sending username to Edit Details VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editDetailsVC = segue.destination as? EditDetailsViewController
        editDetailsVC?.user = username
    }
    
    // MARK: Unwind
    // Updating user details at this VC after saving new values on Edit Details VC
    @IBAction func unwindSegueToDetailsVC(segue: UIStoryboardSegue) {
        if !firstName.isEmpty { firstNameLabel.text = firstName }
        if !lastName.isEmpty { lastNameLabel.text = lastName }
        if !phone.isEmpty { phoneLabel.text = phone }
        if !city.isEmpty { cityLabel.text = city }
        if !country.isEmpty { countryLabel.text = country }
    }

}

// MARK: Set backgound color
extension DetailsViewController {
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemTeal.cgColor, UIColor.systemIndigo.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
