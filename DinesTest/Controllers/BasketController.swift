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
        var totalPrice = 0.0
        if items.count > 0 {
            totalPrice = items.reduce(0){$0 + ($1.totalPrice)}
        }
        return NSLocalizedString("label.basket.total", comment: "") + "\(totalPrice)"
    }
}
