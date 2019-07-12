//
//  Api.swift
//  Reqres In
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import Alamofire

class Api {
    
    func fetchPeoples(page: Int, completion: @escaping (PeopleResponse?, Bool) -> ()){
        AF.request("https://reqres.in/api/users?page=\(page)&per_page=10&delay=3").responseJSON(completionHandler: { response in
            do {
                try completion(JSONDecoder().decode(PeopleResponse.self, from: response.data!), false)
            }catch let err{
                print(err)
                completion(nil, true)
            }
        })
    }
    
    func getUser(completion: @escaping (GithubUserResponse?, Bool) -> ()){
        AF.request("https://api.github.com/users/erthru").responseJSON(completionHandler: { response in
            do{
                try completion(JSONDecoder().decode(GithubUserResponse.self, from: response.data!),false)
            }catch let err{
                completion(nil, true)
                print(err)
            }
        })
    }
    
}
