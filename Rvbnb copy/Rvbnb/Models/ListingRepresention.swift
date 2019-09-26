//
//  Listing.swift
//  Rvbnb
//
//  Created by brian vilchez on 9/24/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
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
