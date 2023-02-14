//
//  GroupsTableViewController.swift
//  AddressBook-Scotty-SeaBass
//
//  Created by Sebastian Guiscardo on 2/13/23.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    // MARK: - Lifecycle
    
    
    // MARK: - Outlets
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Actions
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        GroupController.sharedInstances.createGroup()
        tableView.reloadData()
    }
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return GroupController.sharedInstances.groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
        
        let group = GroupController.sharedInstances.groups[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = group.name
        config.secondaryText = "\(group.people.count)"
        cell.contentConfiguration = config
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let group = GroupController.sharedInstances.groups[indexPath.row]
            GroupController.sharedInstances.deleteGroup(group: group)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    // MARK: - Navigation
    //IIDOO
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "groupCell" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? PersonTableViewController {
                    let groupToSend = GroupController.sharedInstances.groups[indexPath.row]
                    destinationVC.group = groupToSend 
                }
            }
        }
        
 
    }
    

}
