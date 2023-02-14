//
//  Group.swift
//  AddressBook-Scotty-SeaBass
//
//  Created by Sebastian Guiscardo on 2/13/23.
//

import Foundation

class Group: Codable {
    
    let id: UUID
    var name: String
    var people: [Person]
    
    init(id: UUID = UUID(), name: String, people: [Person] = []) {
        self.id = id
        self.name = name
        self.people = people
    }
}//end of class

// MARK: - Extension
extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.id == rhs.id
    }
}//end of class
