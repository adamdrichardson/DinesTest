//
//  DinesTestTests.swift
//  DinesTestTests
//
//  Created by Adam Richardson on 15/02/2023.
//

import XCTest
@testable import DinesTest

class DinesTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: ApiHandler tests
    func testGetEndpointFood() throws {
        let expectedResult = Constants.urls.bestFoods
        let menuSelection: MenuSelection = .food
        
        let result = ApiHandler.shared.getEndpoint(menuSelection: menuSelection)
        
        XCTAssertTrue(result == expectedResult)
    }
    
    func testGetEndpointDrinks() throws {
        let expectedResult = Constants.urls.drinks
        let menuSelection: MenuSelection = .drink
        
        let result = ApiHandler.shared.getEndpoint(menuSelection: menuSelection)
        
        XCTAssertTrue(result == expectedResult)
    }
    
    func testGetEndpointDesert() throws {
        let expectedResult = Constants.urls.deserts
        let menuSelection: MenuSelection = .desert
        
        let result = ApiHandler.shared.getEndpoint(menuSelection: menuSelection)
        
        XCTAssertTrue(result == expectedResult)
    }

}
