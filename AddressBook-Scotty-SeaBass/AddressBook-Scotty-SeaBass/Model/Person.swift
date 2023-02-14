//
//  Person.swift
//  AddressBook-Scotty-SeaBass
//
//  Created by Sebastian Guiscardo on 2/13/23.
//

import Foundation

class Person {
    
    let id: UUID
    var name: String
    var address: String
    
    init(id: UUID = UUID(), name: String, address: String) {
        self.id = id
        self.name = name
        self.address = address
    }
}//end of class

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
       return lhs.id == rhs.id
    }
}
