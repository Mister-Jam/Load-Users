//
//  UsersModel.swift
//  ChallengeV1
//
//  Created by King Bileygr on 5/3/21.
//

import Foundation

//MARK:- API Model
struct UsersModel: Codable {
    var name, email: String
    var address: Address
    var phone: String
    var company: Company
}

struct Address: Codable {
    var street, suite, city, zipcode: String
    var geo: Coordinates
}

struct Coordinates: Codable {
    var lat, lng: String
}

struct Company: Codable {
    var name: String
}
