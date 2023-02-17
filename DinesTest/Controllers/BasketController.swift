//
//  BasketController.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import Foundation
import SwiftUI

class BasketController {
    static let shared = BasketController()
    
    func getBasketItemTitle(item: BasketItem) -> String {
        return "\(String(describing: item.quantity))x \(item.name!))"
    }
    
    func getBasketTotalString(items: FetchedResults<BasketItem>) -> String {
        let totalPrice = self.getBasketTotalPrice(items: items)
        
        return NSLocalizedString("label.basket.total", comment: "") + "\(totalPrice)"
    }
    
    func getBasketTotalPrice(items: FetchedResults<BasketItem>) -> Double {
        var totalPrice = 0.0
        if items.count > 0 {
            totalPrice = items.reduce(0){$0 + ($1.totalPrice)}
        }
        return totalPrice
    }
    
    func getBasketTotalItems(items: FetchedResults<BasketItem>) -> Int {
        var quantity = 0
        if items.count > 0 {
            quantity = Int(items.reduce(0){$0 + ($1.quantity)})
        }
        
        return quantity
    }
    
    func getBasketAlertBodyString(items: FetchedResults<BasketItem>) -> String {
        
        let quantity = self.getBasketTotalItems(items: items)
        var part2String = NSLocalizedString("alert.basket.checkout.body.2.single", comment: "")
        if quantity > 1 {
            part2String = NSLocalizedString("alert.basket.checkout.body.2.multi", comment: "")
        }
        let totalPrice = self.getBasketTotalPrice(items: items)
        
        return NSLocalizedString("alert.basket.checkout.body", comment: "") + "\(quantity)" + part2String + "\(totalPrice)"
    }
}
