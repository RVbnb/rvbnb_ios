//
//  ListingRepresentation.swift
//  RvBNB
//
//  Created by Austin Potts on 9/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


struct ListingRepresentation: Codable {
    
    let id: Int
    let landDescription: String
    let photo: String
    let pricePerDay: String
    
    enum CodingKeys: String, CodingKey {
        case pricePerDay = "price_Per_Day"
        case id
        case landDescription
        case photo
    }
    
}
