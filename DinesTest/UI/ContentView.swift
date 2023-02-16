//
//  ContentView.swift
//  DinesTest
//
//  Created by Adam Richardson on 15/02/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            NavigationView {
                MenuRootView()
                    .navigationTitle("label.menuView.title")
            }
            .tabItem{
                Image(systemName: "menucard")
                Text("label.menuView.title")
            }
            .tag(0)
            
            BasketView()
                .tabItem {
                    Image(systemName: "basket")
                    Text("label.basketView.title")
                }
                .tag(1)
            
            OrderHistoryView()
                .tabItem {
                    Image(systemName: "list.clipboard")
                    Text("label.orderView.title")
                }
                .tag(2)
        }
    }

    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
