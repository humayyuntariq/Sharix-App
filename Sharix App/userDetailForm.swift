//
//  userDetailForm.swift
//  Sharix App
//
//  Created by Humayun Tariq on 30/06/2025.
//

import Foundation
import UIKit

class userDetails: UIViewController{
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    /// Create an instance of `person` and save the details entered in the text fields.
    /// - Parameter sender: The button that triggers the action.
    /// This function collects the data from the text fields and creates a new `person` object.
    ///```swift
    ///let newUser = person(
   /// name: nameTextField.text ?? "",
   /// email: emailTextField.text ?? "",
    ///phone: phoneTextField.text ?? "",
    ///address: addressTextField.text ?? ""
    /// )
    ///```
    @IBAction func saveButton(_ sender: Any) {
        
        let newUser = person(
                name: nameTextField.text ?? "",
                email: emailTextField.text ?? "",
                phone: phoneTextField.text ?? "",
                address: addressTextField.text ?? ""
            )
            
            var savedUsers = loadSavedUsers()
            savedUsers.append(newUser)
            
            if let data = try? JSONEncoder().encode(savedUsers) {
                UserDefaults.standard.set(data, forKey: "savedUsers")
            }
            
            // Show pop-up with user details
            let message = """
            Name: \(newUser.name)
            Email: \(newUser.email)
            Phone: \(newUser.phone)
            Address: \(newUser.address)
            """
            let alert = UIAlertController(title: "User Saved", message: message, preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                alert.dismiss(animated: true, completion: nil)
            }
            
            // Optional: Clear text fields
            nameTextField.text = ""
            emailTextField.text = ""
            phoneTextField.text = ""
            addressTextField.text = ""
        
    }
    
    @IBAction func showtableButton(_ sender: Any) {
        
            
    }
    
    
    func loadSavedUsers() -> [person] {
        
        if let data = UserDefaults.standard.data(forKey: "savedUsers"),
           let savedUsers = try? JSONDecoder().decode([person].self, from: data) {
            return savedUsers
        }
        
        return []
    }
    
}
