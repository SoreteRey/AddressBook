//
//  Group Controller.swift
//  AddressBook-Scotty-SeaBass
//
//  Created by Sebastian Guiscardo on 2/13/23.
//

import Foundation

class GroupController {
    //singleton
    static let sharedInstances = GroupController()
    //sot
    var groups: [Group] = []
    
    // MARK: - Initializers
    init() {
        loadContactsFromDisk()
    }
    
    // MARK: - Crud
    
    func createGroup(name: String = "Untitled Group", people: [Person] = []) {
        let newGroup = Group(name: name)
        groups.append(newGroup)
        
        saveContactsToDisk()
    }
    
    func updateGroup(groupToUpdate: Group, newName: String) {
        groupToUpdate.name = newName
        
    saveContactsToDisk()
    }
    
    func deleteGroup(group grouptoDelete: Group) {
        guard let index = groups.firstIndex(of: grouptoDelete) else { return }
        groups.remove(at: index)
        
        saveContactsToDisk()
    }

 
    func saveContactsToDisk() {
        guard let saveLocation = fileURL else { return }
        do {
            let jsonData = try JSONEncoder().encode(groups)
            try jsonData.write(to: saveLocation)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func loadContactsFromDisk() {
        guard let url = fileURL else { return }
        do {
            let retrievedJSONData = try Data(contentsOf: url)
            let decodeGroups = try JSONDecoder().decode([Group].self, from: retrievedJSONData)
            self.groups = decodeGroups
        } catch let error {
            print(error.localizedDescription)
        }
    }
    // Computed Property
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let finalURL = documentsDirectory.appendingPathComponent("addressbook.json")
        
        return finalURL
    }// End of URL
}//end of class

