//
//  GithubUser.swift
//  Reqres In
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation

struct GithubUserResponse: Decodable{
    
    let login: String
    let avatarUrl: String
    let name: String
    
    private enum CodingKeys: String, CodingKey{
        case login
        case avatarUrl = "avatar_url"
        case name
    }
    
}
