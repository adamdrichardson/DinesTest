//
//  MenuDetailView.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import SwiftUI

struct MenuDetailView: View {
    
    let menuItem: MenuItem
    
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    Spacer()
                    DetailImageView(menuItem.imageString ?? "", loadNow: true)
                        .frame(width: 300)
                        .padding()
                    Text(menuItem.description ?? "")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 20))
                        .padding()
                    Text("label.itemDetail.ideal.body")
                        .font(.system(size: 16))
                        .multilineTextAlignment(.leading)
                        .padding()
                    Text(MenuController.shared.getDetailPriceString(price: menuItem.price))
                        .padding()
                    Button(action: {
                        LocalDataHandler.shared.addNewBasketItem(menuItem: menuItem, quantity: 1)
                        self.showingAlert = true
                    }, label: {
                        Text("label.itemDetail.button.add.title")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(Constants.colours.buttonTextColour)
                            .background(Constants.colours.buttonBgColour)
                            .cornerRadius(Constants.numbers.cornerRadius)
                    })
                        .padding()
                        .alert(isPresented: $showingAlert, content: {
                            Alert(title: Text("alert.addItem.title"), message: Text(MenuController.shared.getAddItemAlertString(menuItem: menuItem)), dismissButton: .default(Text("alert.addItem.continue"), action: {
                                self.showingAlert = false
                            }))
                        })
                }
            }
            
        }
    }
}

struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(menuItem: MenuItem(itemId: "1", imageString: "https://goldbelly.imgix.net/uploads/showcase_media_asset/image/132029/german-chocolate-killer-brownie-tin-pack.5ebc34160f28767a9d94c4da2e04c4b9.jpg?ixlib=react-9.0.2&auto=format&ar=1%3A1", name: "Cheeseburger", description: "A nice cheeseburger", price: 7.99, rate: 1, location: "London, UK"))
    }
}

struct AddItemBasketeButton: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("alert.addItem.continue")
        })
    }
}
