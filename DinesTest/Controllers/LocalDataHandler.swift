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
}
