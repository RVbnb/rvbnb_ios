//
//  UserRepresentation.swift
//  Rvbnb
//
//  Created by brian vilchez on 9/24/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
struct UserRepresentation: Codable {
    let username: String
    let password: String
    let isLandOwner: Bool
    
    enum CodingKeys: String, CodingKey {
        case username
        case password
        case isLandOwner = "is_land_owner"
    }
}
