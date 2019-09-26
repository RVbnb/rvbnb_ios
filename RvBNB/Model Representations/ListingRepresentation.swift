//
//  ListingRepresentation.swift
//  RvBNB
//
//  Created by brian vilchez on 9/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ListingRepresentation: Codable {
    
    
    let landPhoto: String
    let location: String
    let ownerID: Int
    let pricePerDay: Double
    let landDescription: String
    
    enum CodingKeys: String, CodingKey {
        case landPhoto
        case location
        case ownerID = "owner_id"
        case pricePerDay = "price_per_day"
        case landDescription = "description"
    }
}
