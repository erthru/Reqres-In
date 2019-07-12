//
//  ListsPeopleViewModelTest.swift
//  Reqres InTests
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import XCTest
import RxSwift

@testable import Reqres_In

class ListsPeopleViewModelTest: XCTestCase{
    
    let viewModel = ListsPeopleViewModel(api: ApiMock())
    let disposeBag = DisposeBag()
    
    func testGet(){
        
        viewModel.get()
        viewModel.peoples.subscribe({
            
            XCTAssertEqual($0.element![0].id, 1)
            
        }).disposed(by: disposeBag)
        
    }
    
    func testNext(){
        
        viewModel.next()
        viewModel.peoples.subscribe({
          
            XCTAssertEqual($0.element![0].id, 1)
            
        }).disposed(by: disposeBag)
        
    }
    
}
