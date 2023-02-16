//
//  MenuListView.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import SwiftUI

struct MenuListView: View {
    
    let menuSelected: MenuSelection
    
    var body: some View {
        Text("Menu list view")
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(menuSelected: .food)
    }
}
