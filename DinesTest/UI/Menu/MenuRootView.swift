//
//  MenuRootView.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import SwiftUI

struct MenuRootView: View {
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    MenuRootButtonView(menuOptions: MenuController.shared.getRootMenuDetails(menuSelected: .food))
                        .cornerRadius(10.0)
                        .padding()
                    MenuRootButtonView(menuOptions: MenuController.shared.getRootMenuDetails(menuSelected: .drink))
                        .cornerRadius(10.0)
                        .padding()
                    MenuRootButtonView(menuOptions: MenuController.shared.getRootMenuDetails(menuSelected: .desert))
                        .cornerRadius(10.0)
                        .padding()
                    
                }
            }
        }
    }
}

struct MenuRootView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRootView()
    }
}
