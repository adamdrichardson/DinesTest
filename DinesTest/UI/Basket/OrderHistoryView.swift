//
//  OrderHistoryView.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import SwiftUI

struct OrderHistoryView: View {
    
    @FetchRequest(entity: OrderItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \OrderItem.timeStamp, ascending: false)]
    ) var items: FetchedResults<OrderItem>
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(items, id: \.id) {
                        OrderHistoryRowView(order: $0)
                    }
                }
                if items.count == 0 {
                    Spacer()
                    Text("label.order.empty")
                        .multilineTextAlignment(.leading)
                        .padding()
                    Spacer()
                }
            }
        }
    }
}

struct OrderHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryView()
    }
}
