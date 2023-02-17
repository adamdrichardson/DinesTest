//
//  DinesTestTests.swift
//  DinesTestTests
//
//  Created by Adam Richardson on 15/02/2023.
//

import XCTest
import CoreData
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
    
    func testItemTotalPrice() throws {
        let expectedTotal = Double(5 * 5.99)
        
        let quantity = 5
        let price = 5.99
        
        let result = MathsHelper.shared.getItemTotalPrice(quantity: quantity, price: price)
        
        XCTAssertTrue(expectedTotal == result)
    }

    func testGetOrderDateString() throws {
        let testDate = Date()
        
        let testString = NSLocalizedString("label.order.date.title", comment: "")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - HH:MM"
        let dateString = dateFormatter.string(from: testDate)
        
        let expectedResult = testString + dateString
        
        let result = OrderHistoryController.shared.getOrderDateString(date: testDate)
        
        XCTAssertTrue(expectedResult == result)
        
    }
    
    func testGetDateAsString() throws {
        let testDate = Date()
                
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - HH:MM"
        let dateString = dateFormatter.string(from: testDate)
        
        let result = DateFormatHelper.shared.getDateAsString(date: testDate)
        
        XCTAssertTrue(dateString == result)
    }
    
    func testAddBasketItem() throws {
        let context = TestCoreDataStack().persistentContainer.newBackgroundContext()
        expectation(forNotification: .NSManagedObjectContextDidSave, object: context, handler: { _ in
            return true
        })
        let testBasketItem = BasketItem(context: context)
        testBasketItem.id = UUID()
        testBasketItem.quantity = 1
        testBasketItem.totalPrice = 5.99
        testBasketItem.name = "Test Item"
        testBasketItem.itemId = "123"
        testBasketItem.itemPrice = 5.99
        
        try! context.save()
        waitForExpectations(timeout: 2.0, handler: { error in
            XCTAssertNil(error, "Save did not occur")
            
        })
    }
    
    func testAddOrderItem() throws {
        let context = TestCoreDataStack().persistentContainer.newBackgroundContext()
        expectation(forNotification: .NSManagedObjectContextDidSave, object: context, handler: { _ in
            return true
        })
        
        let testOrderItem = OrderItem(context: context)
        testOrderItem.id = UUID()
        testOrderItem.totalPrice = 9.99
        testOrderItem.timeStamp = Date()
        testOrderItem.itemTotal = 1
        
        try! context.save()
        waitForExpectations(timeout: 2.0, handler: { error in
            XCTAssertNil(error, "Save did not occur")
            
        })
    }
}

class TestCoreDataStack: NSObject {
    lazy var persistentContainer: NSPersistentContainer = {
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null")
        let container = NSPersistentContainer(name: "DinesTest")
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    
}
