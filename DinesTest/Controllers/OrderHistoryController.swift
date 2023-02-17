//
//  OrderHistoryController.swift
//  DinesTest
//
//  Created by Adam Richardson on 17/02/2023.
//

import Foundation

class OrderHistoryController {
    static let shared = OrderHistoryController()
    
    func getOrderDateString(date: Date?) -> String {
        var dateString = "Unknown"
        if date != nil {
            dateString = DateFormatHelper.shared.getDateAsString(date: date!)
        }
        
        return NSLocalizedString("label.order.date.title", comment: "") + dateString
    }
    
    func getOrderQuantityString(quantity: Int16) -> String {
        return NSLocalizedString("label.order.quantity.title", comment: "") + "\(quantity)"
    }
    
    func getOrderPriceString(price: Double) -> String {
        return NSLocalizedString("label.order.price.title", comment: "") + "\(price)"
    }
}
