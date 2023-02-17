//
//  MenuListView.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import SwiftUI

struct MenuListView: View {
    
    let errorPub = NotificationCenter.default.publisher(for: Constants.notificationNames.apiErrorNotification)
    
    
    var menuOption: MenuSelection
    @StateObject private var menu: MenuVM
    
    @State private var isShowingError = false
    @State private var errorMsg = ""
    
    public init(menuSelected: MenuSelection) {
        self._menu = StateObject(wrappedValue: MenuVM(menuSelection: menuSelected))
        self.menuOption = menuSelected
    }
    
    var body: some View {
        List(menu.items, id: \.self) { item in
            NavigationLink(destination: MenuDetailView(menuItem: item)) {
                MenuListItemView(menuItem: item)
                    .cornerRadius(Constants.numbers.cornerRadius)
            }
            .buttonStyle(PlainButtonStyle())
            
        }
        .navigationBarTitle(MenuController.shared.getRootMenuTitle(menuSelected: menuOption))
        .onReceive(errorPub, perform: { notification in
            print("error notification received")
            self.isShowingError = true
            if let info = notification.userInfo! as? [String: String] {
                print("info: \(info)")
                errorMsg = info["error"]!
            }
        })
        .alert(isPresented: $isShowingError, content: {
            Alert(title: Text("alert.api.error.title"), message: Text(errorMsg), dismissButton: .destructive(Text("alert.api.error.button.ok")))
        })
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(menuSelected: .food)
    }
}
