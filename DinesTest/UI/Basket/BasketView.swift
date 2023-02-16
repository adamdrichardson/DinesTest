//
//  BasketView.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import SwiftUI

struct BasketView: View {
    
    @FetchRequest(entity: BasketItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \BasketItem.name, ascending: true)]
    ) var items: FetchedResults<BasketItem>
    
    
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(items, id: \.id) {
                        BasketRowView(item: $0)
                    }.onDelete(perform: deleteItem)
                }
                
                Text(BasketController.shared.getBasketTotalString(items: items))
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Button(action: {
                    //TODO: checkout
                }, label: {
                    Text("label.basket.button.checkout")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Constants.colours.buttonTextColour)
                        .background(Constants.colours.buttonBgColour)
                        .cornerRadius(Constants.numbers.cornerRadius)
                })
            }
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        offsets.forEach { index in
            let item = self.items[index]
            LocalDataHandler.shared.deleteBasketItem(item: item)
        }
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
