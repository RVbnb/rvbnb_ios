//
//  RvBNB+Convenience.swift
//  RvBNB
//
//  Created by Austin Potts on 9/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData


extension Register {
    
    var registerUserRepresentation: RegisterUserRepresentation?{
        guard let username = userName,
        let password = password
            else{return nil}
        
        return RegisterUserRepresentation(userName: username, password: password, isLandOwner: isLandOwner)
        
    }
    
    
    convenience init(userName: String, password: String, isLandOwner: Bool, context: NSManagedObjectContext) {
        
        self.init(context: context)
        
        self.userName = userName
        self.password = password
        self.isLandOwner = isLandOwner
        
    }
    
    
    
    @discardableResult convenience init?(registerUserRepresentation: RegisterUserRepresentation, context: NSManagedObjectContext) {
        
        self.init(userName: registerUserRepresentation.userName, password: registerUserRepresentation.password, isLandOwner: registerUserRepresentation.isLandOwner, context: context)
        
        
    }
    
    
    
    
}
