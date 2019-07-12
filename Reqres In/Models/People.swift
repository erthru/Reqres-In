//
//  People.swift
//  Reqres In
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation

struct People: Decodable {
    
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    private enum CodingKeys: String, CodingKey{
        
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
        
    }
    
}
