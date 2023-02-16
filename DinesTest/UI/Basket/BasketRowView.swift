//
//  BasketRowView.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import SwiftUI

struct BasketRowView: View {
    
    let item: BasketItem
    
    var body: some View {
        HStack {
            Text(BasketController.shared.getBasketItemTitle(item: item))
                .padding()
            Text(MenuController.shared.getPriceString(price: item.totalPrice))
                .padding()
        }
    }
}

struct BasketRowView_Previews: PreviewProvider {
    static var previews: some View {
        BasketRowView(item: BasketItem())
    }
}
