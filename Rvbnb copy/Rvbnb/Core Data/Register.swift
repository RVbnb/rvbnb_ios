//
//  Register.swift
//  Rvbnb
//
//  Created by brian vilchez on 9/24/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

extension Register {
    
    var registerRepresentation: UserRegisterRepresentation? {
        guard let username = username, let password = password else {return nil}
        return UserRegisterRepresentation(username: username, password: password, isLandOwner: isLandOwner)
    }
    
    convenience init(username: String, password: String, isLandOwner: Bool, context: NSManagedObjectContext){
        self.init(context: context)
        self.username = username
        self.password = password
        self.isLandOwner = isLandOwner
    }
    
    @discardableResult convenience init?(registerRepresentation: UserRegisterRepresentation, context: NSManagedObjectContext){
        self.init(username: registerRepresentation.username, password: registerRepresentation.password,
                  isLandOwner: registerRepresentation.isLandOwner, context: context)
    }
}
