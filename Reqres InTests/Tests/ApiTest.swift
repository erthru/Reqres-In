//
//  ApiTest.swift
//  Reqres InTests
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import XCTest
import Alamofire

@testable import Reqres_In

class ApiTest: XCTestCase{
    
    let api = Api()
    
    func testFetchPeoples(){
        
        let e = expectation(description: "Alamofire")
        
        api.fetchPeoples(page: 1, completion: {response, err in
            
            let didPeoplesCountNotZero = response!.poeple.count > 0
            
            XCTAssertEqual(didPeoplesCountNotZero, true)
            
            e.fulfill()
            
        })
        
        waitForExpectations(timeout: 5.0, handler: nil)
        
    }
    
    func testGetUser(){
        
        let e = expectation(description: "Alamofire")
        
        api.getUser(completion: {response, err in
            
            let didNameNotNil = response?.name != nil || response?.name != ""
            
            XCTAssertEqual(didNameNotNil, true)
            
            e.fulfill()
            
        })
        
        waitForExpectations(timeout: 5.0, handler: nil)
        
    }
    
}
