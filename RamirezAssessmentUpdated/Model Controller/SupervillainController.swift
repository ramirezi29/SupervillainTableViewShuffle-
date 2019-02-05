//
//  SupervillainController.swift
//  RamirezAssessmentUpdated
//
//  Created by Ivan Ramirez on 2/5/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation
import CoreData

class SupervillainController {
    
    static let shared = SupervillainController()
    
    var predicate: NSPredicate?
    
    var names: [Supervillain] {
        let request: NSFetchRequest<Supervillain> = Supervillain.fetchRequest()
        request.predicate = predicate
        
        do {
            return try CoreDataStack.managedObjectContext.fetch(request)
        } catch {
            print("Error fetching names \(error)")
            return []
        }
    }
    
    var section: Int {
        //[even] [odd]
        //4 names -> 2 sections
        let sectionCount = names.count / 2
        return names.count % 2 == 0 ? sectionCount : sectionCount + 1
    }
    
    let groupMatrix = 2
    
    //Need to add the names of type String in order to create an array of Strings but also account for the NSManagedObject of Supervillain entity
    func add(name: String) -> Supervillain {
        let newName = Supervillain(name: name)
        saveToPersistentStorage()
        return newName
    }
    
    //Delete
    func remove(superVillains: Supervillain) {
        //optional
        if let moc = superVillains.managedObjectContext {
            moc.delete(superVillains)
            saveToPersistentStorage()
        }
    }
    
    //Update
    func update(superVillains: Supervillain, name: String) {
        saveToPersistentStorage()
    }
}

extension SupervillainController {
    
    func saveToPersistentStorage() {
        do {
            try CoreDataStack.managedObjectContext.save()
            
        } catch let error {
            print("🚀 There was an error in \(#function); \(error); \(error.localizedDescription) 🚀")
        }
    }
}
