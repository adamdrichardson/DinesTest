//
//  MenuController.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import Foundation


final class MenuController {
    static let shared = MenuController()
    
    func getRootMenuDetails(menuSelected: MenuSelection) -> MenuOptionDetails {
        
        return MenuOptionDetails(title: self.getRootMenuTitle(menuSelected: menuSelected), imageName: self.getRootMenuImageName(menuSelected: menuSelected))
    }
    
    func getRootMenuImageName(menuSelected: MenuSelection) -> String {
        switch menuSelected {
        case .food:
            return "foodMenuItem"
        case .desert:
            return "dessertMenuItem"
        case .drink:
            return "drinkMenuItem"
        }
    }
    
    func getRootMenuTitle(menuSelected: MenuSelection) -> String {
        switch menuSelected {
        case .food:
            return NSLocalizedString("label.menuView.food.title", comment: "")
        case .desert:
            return NSLocalizedString("label.menuView.dessert.title", comment: "")
        case .drink:
            return NSLocalizedString("label.menuView.drink.title", comment: "")
        }
    }
    
    func getPriceString(price: Double?) -> String {
        print("getPriceString")
        guard let itemPrice = price else {
            return "Unknown"
        }
        return "£" + String(itemPrice)
    }
    
    func getDetailPriceString(price: Double?) -> String {
        return NSLocalizedString("label.itemDetail.price", comment: "") + self.getPriceString(price: price)
    }
    
    func getAddItemAlertString(menuItem: MenuItem) -> String {
        return (menuItem.description ?? "") + NSLocalizedString("alert.addItem.body", comment: "") + self.getPriceString(price: menuItem.price)
    }
}
