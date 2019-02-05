//
//  Supervillain+Conv.swift
//  RamirezAssessmentUpdated
//
//  Created by Ivan Ramirez on 2/5/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation
import CoreData

extension Supervillain {
    
    convenience init(name: String, contex: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        
        self.init(context: contex)
        
        self.name = name
    }
}

