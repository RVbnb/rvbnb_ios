//
//  NSMananagedObjectContextExtension.swift
//  Rvbnb
//
//  Created by brian vilchez on 9/24/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    func saveChanges() {
        if hasChanges {
            do {
                try save()
            } catch let error as NSError {
                fatalError("error saving to persistent store: \(error)")
            }
        }
    }
}
