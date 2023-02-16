//
//  Constants.swift
//  DinesTest
//
//  Created by Adam Richardson on 15/02/2023.
//

import Foundation
import SwiftUI


struct Constants {
    struct urls {
        static let bestFoods = URL(string: "https://free-food-menus-api-production.up.railway.app/best-foods")!
        static let deserts = URL(string: "https://free-food-menus-api-production.up.railway.app/desserts")!
        static let drinks = URL(string: "https://free-food-menus-api-production.up.railway.app/drinks")!
    }
    
    struct numbers {
        static let cornerRadius = 10.0
    }
    
    struct colours {
        static let cardBgColour = Color(red: 19/255, green: 13/255, blue: 64/255)
        static let menuItemTextColour = Color.black
        static let buttonBgColour = Color.blue
        static let buttonTextColour = Color.white
    }
}
