//
//  ListingRepresentation.swift
//  RvBNB
//
//  Created by brian vilchez on 9/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

//Re configured Model for Mock Data 

struct ListingRepresentation {//: Codable
    
    
    var landPhoto: UIImage
    var location: String
    var ownerID: Int
    //var pricePerDay: Double
    var landDescription: String
    
    init(landPhoto: String, location: String, ownerID: Int, landDescription: String) {
       self.landPhoto = UIImage(named: landPhoto)!
        
        self.location = location
        
        self.ownerID = ownerID
        self.landDescription = landDescription
    }
    
    
    enum CodingKeys: String, CodingKey {
        case landPhoto
        case location
        case ownerID = "owner_id"
        case pricePerDay = "price_per_day"
        case landDescription = "description"
    }
}
