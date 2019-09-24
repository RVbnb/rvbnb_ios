//
//  CoreDataStack.swift
//  RvBNB
//
//  Created by brian vilchez on 9/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import  CoreData

extension NSManagedObjectContext {
    func saveChanges() {
        if hasChanges {
            do {
                try save()
            } catch {
                fatalError("error saving to persistent store: \(error)")
            }
        }
    }
}


class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    lazy var persistentContainer:NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RvBNB")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("error loading from persistence store: \(error)")
            }
            
        }
        return container
    }()
    
    lazy var mainContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
}
