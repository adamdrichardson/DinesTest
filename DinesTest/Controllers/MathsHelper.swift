//
//  MathsHelper.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import Foundation

class MathsHelper {
    static let shared = MathsHelper()
    
    /**
     This function may seem excessive but I have included it as you may want to modify to allow for discounts or tax
     */
    func getItemTotalPrice(quantity: Int, price: Double) -> Double {
        return Double(quantity) * price
    }
}
