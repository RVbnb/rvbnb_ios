//
//  CoreDataStack.swift
//  Rvbnb
//
//  Created by brian vilchez on 9/24/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Rvbnb")
        container.loadPersistentStores { (_, error) in
            guard let error = error as NSError? else {
                fatalError("error loading from persistent store")}
        }
        return container
    }()
    
    lazy var mainContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
}
