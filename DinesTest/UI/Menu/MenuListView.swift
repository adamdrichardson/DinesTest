//
//  MenuListView.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import SwiftUI

struct MenuListView: View {
    
    var menuOption: MenuSelection
    @StateObject private var menu: MenuVM
    
    public init(menuSelected: MenuSelection) {
        self._menu = StateObject(wrappedValue: MenuVM(menuSelection: menuSelected))
        self.menuOption = menuSelected
    }
    
    var body: some View {
        List(menu.items, id: \.self) { item in
            MenuListItemView(menuItem: item)
                .cornerRadius(Constants.numbers.cornerRadius)
        }
        .navigationBarTitle(MenuController.shared.getRootMenuTitle(menuSelected: menuOption))
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(menuSelected: .food)
    }
}
