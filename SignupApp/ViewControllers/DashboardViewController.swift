//
//  DashboardViewController.swift
//  SignupApp
//
//  Created by Yury on 14.01.23.
//

import UIKit

class DashboardViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet var welcomeUserLabel: UILabel!
    @IBOutlet var logoutButton: UIButton!
    
    // MARK: Public Properties
    // Getting username from previous VC
    var user: String!
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Adding gradient for dashboard screen
        addGradient()
        
        // Setting for button text color
        logoutButton.setTitleColor(.white, for: .normal)
        
        // Checking what to image username or first name
        if usersArray[user]?.fName == "Not specified" {
            welcomeUserLabel.text? += user + "!"
        } else {
            guard let user = usersArray[user] else { return }
            welcomeUserLabel.text? += user.fName + "!"
        }
    }

}

// MARK: Public Methods
// Setting backgound color
extension DashboardViewController {
    func addGradient() {
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = view.bounds
        gradientlayer.colors = [UIColor.systemTeal.cgColor, UIColor.systemIndigo.cgColor]
        view.layer.insertSublayer(gradientlayer, at: 0)
    }
}
