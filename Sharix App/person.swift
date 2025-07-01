//
//  person.swift
//  Sharix App
//
//  Created by Humayun Tariq on 30/06/2025.
//

import Foundation

class person: Codable{
    
    let name: String
    let email: String
    let phone: String
    let address: String
    
    /// Initializes a new instance of the `person` class.
    /// - Parameters:
    ///   - name: The name of the person.
    ///   - email: The email address of the person.
    ///   - phone: The phone number of the person.
    ///   - address: The address of the person.
    init(name: String, email: String, phone: String, address: String) {
        self.name = name
        self.email = email
        self.phone = phone
        self.address = address
    }
        
}
