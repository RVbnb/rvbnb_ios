//
//  Listing.swift
//  Rvbnb
//
//  Created by brian vilchez on 9/24/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
import CoreData

extension Listing {
    
    // MARK: - properties
    
    var listingRepresentation: ListingRepresentation?{
    guard let landPhoto = landPhoto,
          let location = location,
          let landDescription = landDescription else {return nil}
        
        
    return ListingRepresentation(landPhoto: landPhoto, location: location, ownerID: Int(ownerID), pricePerDay: pricePerDay, landDescription: landDescription)
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
