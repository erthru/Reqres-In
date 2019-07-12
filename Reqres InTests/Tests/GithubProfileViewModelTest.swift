//
//  GithubUserViewModelTest.swift
//  Reqres InTests
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import XCTest
import RxSwift

@testable import Reqres_In

class GithubProfileViewModelTest: XCTestCase{
    
    let viewModel = GithubProfileViewModel(api: ApiMock())
    let disposeBag = DisposeBag()
    
    func testGet(){
        
        viewModel.get()
        viewModel.user.subscribe({
            
            XCTAssertEqual($0.element!!.login, "test")
            
        }).disposed(by: disposeBag)
        
    }
    
}
