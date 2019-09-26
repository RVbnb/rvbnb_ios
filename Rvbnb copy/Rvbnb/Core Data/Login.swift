//
//  Login.swift
//  Rvbnb
//
//  Created by brian vilchez on 9/24/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

extension Login {
    
    
    //MARK: - properties
    var loginRepresentation: LoginRepresentation?{
        guard let username = username,
              let password = password else {return nil}
        
        return LoginRepresentation(username: username , password: password)
    }
    
    
    convenience init(username: String, password: String, context: NSManagedObjectContext){
        self.init(context:context)
        self.username = username
        self.password = password
    }
    
    @discardableResult convenience init?(loginRepresentation: LoginRepresentation, context: NSManagedObjectContext){
        self.init(username: loginRepresentation.username, password: loginRepresentation.password, context: context)
    }
}
