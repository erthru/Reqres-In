//
//  ApiMock.swift
//  Reqres InTests
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
@testable import Reqres_In

class ApiMock: Api{
    
    override func fetchPeoples(page: Int, completion: @escaping (PeopleResponse?, Bool) -> ()) {
        
        let people = People(id: 1, email: "test@mail.com", firstName: "Test", lastName: "People", avatar: "avatar_test")
        let peopleResponse = PeopleResponse(page: 1, perPage: 1, total: 1, totalPages: 1, poeple: [people])
        
        completion(peopleResponse, false)
    }
    
    override func getUser(completion: @escaping (GithubUserResponse?, Bool) -> ()) {
        
        let githubUserResponse = GithubUserResponse(login: "test", avatarUrl: "avatar_test", name: "test user")
        completion(githubUserResponse, false)
        
    }
    
}
