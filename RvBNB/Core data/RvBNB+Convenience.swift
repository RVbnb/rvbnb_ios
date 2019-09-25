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

extension Listing {
    
    // MARK: - properties
    
    var listingRepresentation: ListingRepresentation?{
    guard let landPhoto = landPhoto,
          let location = location,
          let landDescription = landDescription else {return nil}
        
        
    return ListingRepresentation(landPhoto: landPhoto, location: location, ownerID: Int64(ownerID), pricePerDay: pricePerDay, landDescription: landDescription)
    }
    
    
    //MARK: - Initializers
    convenience init(ownerID: Int64, location: String, pricePerDay: Double,landPhoto: String,
                     landDescription: String, context: NSManagedObjectContext) {
        
        self.init(context: context)
        self.ownerID = Int64(ownerID)
        self.location = location
        self.pricePerDay = pricePerDay
        self.landPhoto = landPhoto
        self.landDescription = landDescription
    }
    
    @discardableResult convenience init?(listingRepresentation: ListingRepresentation, context: NSManagedObjectContext ) {
        self.init(ownerID: Int64(listingRepresentation.ownerID), location: listingRepresentation.location, pricePerDay: listingRepresentation.pricePerDay,landPhoto: listingRepresentation.landPhoto, landDescription: listingRepresentation.landDescription,context: context)
    }
}



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
