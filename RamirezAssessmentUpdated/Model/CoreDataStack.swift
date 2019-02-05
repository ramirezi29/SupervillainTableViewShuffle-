//
//  CoreDataStack.swift
//  RamirezAssessmentUpdated
//
//  Created by Ivan Ramirez on 2/5/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    static let container: NSPersistentContainer = {
        
        let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
        let container = NSPersistentContainer(name: appName)
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var managedObjectContext: NSManagedObjectContext { return container.viewContext}
}
