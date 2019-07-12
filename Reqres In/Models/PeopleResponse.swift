//
//  PeopleResponse.swift
//  Reqres In
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation

struct PeopleResponse: Decodable {
    
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let poeple: [People]
    
    private enum CodingKeys: String, CodingKey{
        
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case poeple = "data"
        
    }
    
}
