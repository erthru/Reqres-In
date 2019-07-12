//
//  GithubProfileViewModel.swift
//  Reqres In
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class GithubProfileViewModel {
    
    private let api: Api!
    
    let user = BehaviorRelay<GithubUserResponse?>(value: nil)
    
    init(api: Api) {
        self.api = api
    }
    
    func get(){
        api.getUser(completion: {githubUserResponse, err in
            if !err{
                self.user.accept(githubUserResponse)
            }
        })
    }
    
}
