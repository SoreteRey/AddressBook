//
//  Person Controller.swift
//  AddressBook-Scotty-SeaBass
//
//  Created by Sebastian Guiscardo on 2/13/23.
//

import Foundation

class PersonController {
    //Crud
    
    static func createPerson(name: String = "New Contact", address: String = "", group: Group) {
        let newPerson = Person(name: name, address: address)
        group.people.append(newPerson)
        
    }
    
    static func updatePerson(person: Person, newName: String, newAddress: String) {
        person.name = newName
        person.address = newAddress
        
    }
    
    static func deletePerson(personToDelete: Person, from group: Group) {
        guard let index = group.people.firstIndex(of: personToDelete) else { return }
        group.people.remove(at: index)
        
    }
// We need to save!!!! Save meeeeee please!!!!! I don't want to be deleted!!!!
}//end of class

