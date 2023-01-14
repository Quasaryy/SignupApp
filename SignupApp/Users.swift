//
//  Users.swift
//  SignupApp
//
//  Created by Yury on 14.01.23.
//

struct Users {
    var login: String!
    var password: String!
    var details: Details!
}

struct Details {
    var fName: String!
    var lName: String!
    var phone: String!
    var address: String!
    var car: String!
}

var usersArray: [Users] = [Users(login: "user", password: "password", details: Details(fName: "John", lName: "Appleseed", phone: "123456789", address: "One Apple Park Way"))]
