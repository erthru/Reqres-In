//
//  ListsPeopleViewModel.swift
//  Reqres In
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class ListsPeopleViewModel {
    
    private var api: Api!
    
    var peoples = BehaviorRelay<[People]>(value: [])
    var didLoading = BehaviorRelay<Bool>(value: false)
    var didLoadingNext = BehaviorRelay<Bool>(value: false)
    
    private var page = 1
    private var didLoadAll = false
    
    init(api: Api) {
        self.api = api
    }
    
    func get(){
        
        page = 1
        didLoadAll = false
        
        didLoading.accept(true)
        
        api.fetchPeoples(page: page, completion: { response, err in
            if !err {
                self.peoples.accept(response!.poeple)
            }
            
            self.didLoading.accept(false)
        })
        
    }
    
    func next(){
        
        didLoadingNext.accept(true)
        
        page += 1
        
        api.fetchPeoples(page: page, completion: { response, err in
            if !self.didLoadAll {
                if !err {
                    if response?.poeple.count == 0 || response?.poeple == nil{
                        self.didLoadAll = true
                        self.page -= 1
                    }else{
                        self.peoples.accept(self.peoples.value + response!.poeple)
                    }
                }
            }
            
            self.didLoadingNext.accept(false)
        })
        
    }
    
}
