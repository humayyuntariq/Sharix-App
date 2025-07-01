//
//  userDetailTable.swift
//  Sharix App
//
//  Created by Humayun Tariq on 30/06/2025.
//

import Foundation
import UIKit

class userDetailsTable: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var users: [person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            loadUsers()
            tableView.reloadData()
        }
    
    // Load people from UserDefaults
       func loadUsers() {
           if let data = UserDefaults.standard.data(forKey: "savedUsers"),
              let decoded = try? JSONDecoder().decode([person].self, from: data) {
               self.users = decoded
           } else {
               self.users = []
           }
       }
    
    // TableView: number of rows
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return users.count
        }

        // TableView: populate each cell with person data
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let person = users[indexPath.row]

            // Make sure the cell type is your custom class
            let cell = tableView.dequeueReusableCell(withIdentifier: "userDetailsTableCell", for: indexPath) as! userDetailsTableCell

            // Fill cell labels with person data
            cell.nameField.text = person.name
            cell.emailField.text = person.email
            cell.phoneField.text = person.phone
            cell.addressField.text = person.address

            return cell
        }


}

