//
//  BasketController.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import Foundation

class BasketController {
    static let shared = BasketController()
    
    func getBasketItemTitle(item: BasketItem) -> String {
        return "\(String(describing: item.quantity))x \(item.name!))"
    }
}
