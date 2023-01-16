//
//  Users.swift
//  SignupApp
//
//  Created by Yury on 14.01.23.
//

struct Details {
    var password: String!
    var fName: String = "Not specified"
    var lName: String = "Not specified"
    var phone: String = "Not specified"
    var city: String = "Not specified"
    var country: String = "Not specified"
}

var usersArray: [String: Details] = ["user": Details(password: "password", fName: "John", lName: "Appleseed", phone: "123456789", city: "Los Angeles", country: "USA")]
