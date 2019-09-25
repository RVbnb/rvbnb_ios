//
//  UserRepresentation.swift
//  RvBNB
//
//  Created by brian vilchez on 9/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
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
