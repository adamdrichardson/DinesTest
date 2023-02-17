//
//  DinesTestUITests.swift
//  DinesTestUITests
//
//  Created by Adam Richardson on 15/02/2023.
//

import XCTest

class DinesTestUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRootMenuDrink() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let optionRequired = "Drinks"
        
        let drinkLabel = app.staticTexts[optionRequired]
        
        app.swipeUp()
        
        XCTAssertTrue(drinkLabel.isHittable)

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testRootMenuFood() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let optionRequired = "Food"
        
        let foodLabel = app.staticTexts[optionRequired]
        
        app.swipeUp()
        app.swipeDown()
        
        XCTAssertTrue(foodLabel.isHittable)

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testRootMenuDessert() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let optionRequired = "Desserts"
        
        let dessertLabel = app.staticTexts[optionRequired]
        
        app.swipeUp()
        
        XCTAssertTrue(dessertLabel.isHittable)

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testBasketTab() throws {
        let app = XCUIApplication()
        app.launch()
        
        let basket = app.buttons["Basket"]
        
        XCTAssertTrue(basket.isHittable)
    }
    
    func testMenuTab() throws {
        let app = XCUIApplication()
        app.launch()
        
        let menu = app.buttons["Basket"]
        
        XCTAssertTrue(menu.isHittable)
    }
    
    func testOrderTab() throws {
        let app = XCUIApplication()
        app.launch()
                
        let order = app.buttons["Order History"]
        
        XCTAssertTrue(order.isHittable)
    }
    
    func testOrderTitle() throws {
        let app = XCUIApplication()
        app.launch()
        
        let orderButton = app.buttons["Order History"]
        orderButton.tap()
        
        let orderTitle = app.staticTexts["Order History"]
        
        XCTAssertTrue(orderTitle.isHittable)
    }
    
    func testEmptyOrders() throws {
        let app = XCUIApplication()
        app.launch()
        
        let orderButton = app.buttons["Order History"]
        orderButton.tap()
        
        let emptyOrderText = app.staticTexts["There are no previous orders."]
        
        XCTAssertTrue(emptyOrderText.isHittable)
    }
    
    func testEmptyBasket() throws {
        let app = XCUIApplication()
        app.launch()
        
        let basketButton = app.buttons["Basket"]
        basketButton.tap()
        
        let emptyBasketText = app.staticTexts["There are no items in your basket."]
        
        XCTAssertTrue(emptyBasketText.isHittable)
    }
    
    func testCheckoutButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let basketButton = app.buttons["Basket"]
        basketButton.tap()
        
        let checkoutButton = app.buttons["Checkout"]
        
        XCTAssertTrue(checkoutButton.isHittable)
    }

}
