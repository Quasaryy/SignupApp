//
//  DetailsViewController.swift
//  SignupApp
//
//  Created by Yury on 15.01.23.
//

import UIKit

class DetailsViewController: UIViewController {
    
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
        
//        if usersArray[username]?.fName != "Not specified" && usersArray[username]?.lName != "Not specified" {
//            userDetails.text = usersArray[username]!.fName + " " + usersArray[username]!.lName
//        }

       addGradient()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editDetailsVC = segue.destination as? EditDetailsViewController
        editDetailsVC?.user = username
    }
    
    @IBAction func unwindSegueToDetailsVC(segue: UIStoryboardSegue) {

        if !firstName.isEmpty { firstNameLabel.text = firstName }
        if !lastName.isEmpty { lastNameLabel.text = lastName }
        if !phone.isEmpty { phoneLabel.text = phone }
        if !city.isEmpty { cityLabel.text = city }
        if !country.isEmpty { countryLabel.text = country }
    }

}

extension DetailsViewController {
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemTeal.cgColor, UIColor.systemIndigo.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
