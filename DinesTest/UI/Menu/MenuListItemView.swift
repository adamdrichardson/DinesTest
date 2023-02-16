//
//  MenuListItemView.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import SwiftUI

struct MenuListItemView: View {
    
    let menuItem: MenuItem
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(menuItem.description ?? "")
                        .foregroundColor(Constants.colours.menuItemTextColour)
                        .padding(.leading)
                        .padding(.top)
                        .padding(.trailing)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    ItemImageView(urlString: menuItem.imageString ?? "")
                                        .padding()
                    Text(MenuController.shared.getPriceString(price: menuItem.price))
                        .foregroundColor(Constants.colours.menuItemTextColour)
                        .padding()
                }
            }
            
        }
    }
}

struct MenuListItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListItemView(menuItem: MenuItem(itemId: "1", imageString: "https://goldbelly.imgix.net/uploads/showcase_media_asset/image/132029/german-chocolate-killer-brownie-tin-pack.5ebc34160f28767a9d94c4da2e04c4b9.jpg?ixlib=react-9.0.2&auto=format&ar=1%3A1", name: "Cheeseburger", description: "A nice cheeseburger", price: 7.99, rate: 1, location: "London, UK"))
    }
}
