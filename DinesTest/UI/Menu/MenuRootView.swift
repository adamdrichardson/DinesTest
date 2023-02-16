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
                    NavigationLink(destination: MenuListView(menuSelected: .food)) {
                        MenuRootButtonView(menuOptions: MenuController.shared.getRootMenuDetails(menuSelected: .food))
                            .cornerRadius(Constants.numbers.cornerRadius)
                            .padding()
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: MenuListView(menuSelected: .drink)) {
                        MenuRootButtonView(menuOptions: MenuController.shared.getRootMenuDetails(menuSelected: .drink))
                            .cornerRadius(Constants.numbers.cornerRadius)
                            .padding()
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: MenuListView(menuSelected: .desert)) {
                        MenuRootButtonView(menuOptions: MenuController.shared.getRootMenuDetails(menuSelected: .desert))
                            .cornerRadius(Constants.numbers.cornerRadius)
                            .padding()
                    }
                    .buttonStyle(PlainButtonStyle())
                    
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
