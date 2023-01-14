//
//  Users.swift
//  SignupApp
//
//  Created by Yury on 14.01.23.
//

struct Details {
    var password: String!
    var fName: String!
    var lName: String!
    var phone: String!
    var address: String!
    var car: String!
}

var usersArray: [String: Details] = ["user": Details(password: "password", fName: "John", lName: "Appleseed", phone: "123456789", address: "One Apple Park Way")]
