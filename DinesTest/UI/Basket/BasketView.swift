//
//  BasketView.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import SwiftUI

struct BasketView: View {
    
    @State private var showingAlert = false
    
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
                if items.count == 0 {
                    Spacer()
                    Text("label.basket.empty")
                        .multilineTextAlignment(.leading)
                        .padding()
                    Spacer()
                }
                
                
                Text(BasketController.shared.getBasketTotalString(items: items))
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Button(action: {
                    self.showingAlert = true
                }, label: {
                    Text("label.basket.button.checkout")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Constants.colours.buttonTextColour)
                        .background(Constants.colours.buttonBgColour)
                        .cornerRadius(Constants.numbers.cornerRadius)
                })
                    .alert(isPresented: $showingAlert, content: {
                        self.getBasketAlert()
                        
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
    
    func getBasketAlert() -> Alert {
        
        if items.count > 0 {
            return Alert(title: Text("alert.basket.checkout.title") , message: Text(BasketController.shared.getBasketAlertBodyString(items: items)), primaryButton: .default(Text("alert.basket.checkout.button.confirm"), action: {
                LocalDataHandler.shared.saveOrder()
            }), secondaryButton: .destructive(Text("alert.basket.checkout.button.cancel")))
        } else {
            return Alert(title: Text("alert.basket.error.title"), message: Text("alert.basket.error.body"), dismissButton: .default(Text("alert.basket.error.button.ok"), action: {
                self.showingAlert = false
            }))
        }
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
