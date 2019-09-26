//
//  User.swift
//  Rvbnb
//
//  Created by brian vilchez on 9/24/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

extension User {
    
     var userRepresentation: UserRepresentation? {
        guard let username = username, let password = password else {return nil}
        return UserRepresentation(username: username, password: password, isLandOwner: isLandOwner)
    }
    
    convenience init(username: String, password: String, isLandOwner: Bool, context: NSManagedObjectContext){
        self.init(context:context)
        
        self.password = password
        self.username = username
        self.isLandOwner = isLandOwner
    }
    
    @discardableResult convenience init?(userRepresentation: UserRepresentation, context: NSManagedObjectContext){
        self.init(username: userRepresentation.username, password: userRepresentation.password, isLandOwner: userRepresentation.isLandOwner, context: context)
    }
}
