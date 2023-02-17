//
//  OrderHistoryRowView.swift
//  DinesTest
//
//  Created by Adam Richardson on 17/02/2023.
//

import SwiftUI

struct OrderHistoryRowView: View {
    
    let order: OrderItem
    
    var body: some View {
        VStack {
            Text(OrderHistoryController.shared.getOrderDateString(date: order.timeStamp))
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            Text(OrderHistoryController.shared.getOrderQuantityString(quantity: order.itemTotal))
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
            Text(OrderHistoryController.shared.getOrderPriceString(price: order.totalPrice))
                .padding()
        }
    }
}

struct OrderHistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryRowView(order: OrderItem())
    }
}
