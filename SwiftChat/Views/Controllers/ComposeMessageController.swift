//
//  ComposeMessageController.swift
//  SwiftChat
//
//  Created by Jon Reed on 1/25/18.
//  Copyright © 2018 Jon Reed. All rights reserved.
//

import UIKit
import Firebase

/// Class which will handle view control functions for creating a new converation
class ComposeMessageController: UITableViewController {
    
    // Cell identifiier for table view
    let cellId = "cellId"
    // Array of user objects
    var users = [User]()
    
    // Called when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up the navigation items on the top var
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.title = "Compose"
        
        tableView.register(UserTableCell.self, forCellReuseIdentifier: cellId)
        
        fetchUsers()
    }
    
    /// Function which populates the user array by connecting to the firebase database, and reloads the table view on new user creation
    func fetchUsers() {
        // Connect to the Firebase database, reference all children of users, and create an observer
        FIRDatabase.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            
            // Parse the database data and add the user to the array
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = User(dictionary: dictionary)
                user.id = snapshot.key
                self.users.append(user)
                
                // UI must run on the main thread, so run the table reload asynchronously
                DispatchQueue.main.async(execute: {
                    // When a new user is added, reload the table of users
                    self.tableView.reloadData()
                })
            }
            }, withCancel: nil)
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    /* Apple specific code for formatting of the table view */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserTableCell
        
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    var messagesController: MessagesTableVC?
    
    /// Function which will dismiss the composition controller upon selection of a user
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) { 
            print("Dismiss completed")
            let user = self.users[indexPath.row]
            self.messagesController?.showChatControllerForUser(user)
        }
    }

}
