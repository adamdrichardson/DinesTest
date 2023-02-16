//
//  LocalDataHandler.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import Foundation
import CoreData

class LocalDataHandler {
    static let shared = LocalDataHandler()
    var moc: NSManagedObjectContext!
    
    func saveContext() {
        PersistenceController.shared.saveContext()
    }
    
    func getManagedContext() -> NSManagedObjectContext {
        return PersistenceController.shared.getManagedContext()
    }
    
    func addNewBasketItem(menuItem: MenuItem, quantity: Int) {
        
        moc = self.getManagedContext()
        
        let basketItem = BasketItem(context: moc)
        basketItem.id = UUID()
        basketItem.itemId = menuItem.itemId!
        basketItem.name = menuItem.description!
        basketItem.itemPrice = menuItem.price!
        basketItem.quantity = Int16(quantity)
        basketItem.totalPrice = MathsHelper.shared.getItemTotalPrice(quantity: quantity, price: menuItem.price!)
        
        self.saveContext()
        
    }
    
    func deleteBasketItem(item: BasketItem) {
        moc = self.getManagedContext()
        
        moc.delete(item)
        
        self.saveContext()
    }
    
    func getBasketQuantity() -> Int {
        let fetchRequest = BasketItem.fetchRequest()
        
        moc = self.getManagedContext()
        
        do {
            let items = try moc.fetch(fetchRequest)
            
            if items.count > 0 {
                let quantityTotal = Int(items.reduce(0){$0 + ($1.quantity) })
                return quantityTotal
            } else {
                print("There are no items in the basket")
                return 0
            }
            
        } catch {
            print("There was an error getting the basket items")
            return 0
        }
    }
    
    func getBasketTotal() -> Double {
        let fetchRequest = BasketItem.fetchRequest()
        
        moc = self.getManagedContext()
        
        do {
            let items = try moc.fetch(fetchRequest)
            
            if items.count > 0 {
                let priceTotal = items.reduce(0){$0 + ($1.totalPrice)}
                return priceTotal
            } else {
                print("there are no items in the basket")
                return 0.0
            }
        } catch {
            //This would be a great place to log with analytics or Crashlytics
            print("There was an error getting the basket items")
            return 0.0
        }
    }
}
