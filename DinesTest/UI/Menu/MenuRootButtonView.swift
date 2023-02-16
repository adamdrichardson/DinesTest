//
//  MenuRootButtonView.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import SwiftUI

struct MenuRootButtonView: View {
    
    let menuOptions: MenuOptionDetails
    
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                Image(menuOptions.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, idealWidth: 250, maxWidth: 300, minHeight: 0, idealHeight: 250, maxHeight: 300, alignment: .center)
                    .padding()
                Text(menuOptions.title)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
            }
        }
    }
}

struct MenuRootButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRootButtonView(menuOptions: MenuOptionDetails(title: "Food", imageName: "foodMenuItem"))
    }
}
