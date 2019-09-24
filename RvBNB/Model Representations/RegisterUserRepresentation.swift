//
//  RegisterUserRepresentation.swift
//  RvBNB
//
//  Created by Austin Potts on 9/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


struct RegisterUserRepresentation: Codable {
    
   let userName: String
   let password: String
   let isLandOwner: Bool
    
    enum CodingKeys: String, CodingKey {
        case userName
        case password
        case isLandOwner = "is_Land_Owner"
    }
    
}

